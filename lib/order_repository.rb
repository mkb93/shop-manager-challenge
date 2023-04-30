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

  private
  
  def sql_integrater(sql,params)
    DatabaseConnection.exec_params(sql, params)
  end

  def sql_to_order(item)
    order = Order.new
    order.id = item['id']
    order.name = item['name']
    order.date = item['date']
    order.price = item['price']
    order.items = item['items']
    return order
  end
end
