require_relative 'order'

class OrderRepository
  def all
    result_array = sql_integrater('SELECT * FROM orders;',[])
    orders = []
    result_array.each do |product|
      order = sql_to_order(product)
      orders << order
    end
    return orders
  end

  def find(id)
    result = sql_integrater('SELECT * FROM orders WHERE id = $1;', [id])
    item = result.first
    order = sql_to_order(item)
    return order
  end
  def create(order)
    sql_integrater('INSERT INTO orders (name, date) VALUES ($1,$2);',
    [order.name, order.date])

    return nil
  end

  def delete(order)
    sql_integrater('DELETE FROM orders WHERE name = $1;',[order.name])
    return nil
  end

  def update(order)
    sql_integrater('UPDATE orders SET name = $1, date = $2 WHERE id = $3;',
    [order.name, order.date, order.id])
    return nil
  end
  private
  
  def sql_integrater(sql,params)
    DatabaseConnection.exec_params(sql, params)
  end

  def sql_to_order(item)
    order = Order.new(item['name'],item['date'])
    order.id = item['id']
    return order
  end
end
