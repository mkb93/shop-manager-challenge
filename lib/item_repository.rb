require_relative 'item'

class ItemRepository
  def all
    result_array = sql_integrater('SELECT * FROM items;',[])
    items = []
    result_array.each do |product|
      item = sql_to_item(product)
      items << item
    end
    return items
  end

  def find(id)
    result = sql_integrater('SELECT * FROM items WHERE id = $1;', [id])
    item = result.first
    order = sql_to_item(item)
    return order
  end

  def create(item)
    sql_integrater('INSERT INTO items (name, price, amount) VALUES ($1, $2, $3);',
    [item.name, item.price, item.amount])
    return nil
  end

  def delete(item)
    sql_integrater('DELETE FROM items WHERE name = $1;', 
    [item.name])
    return nil
  end

  def update(item)
    sql_integrater('UPDATE items SET name = $1, price = $2, amount = $3 WHERE id = $4;',
    [item.name, item.price, item.amount, item.id])
    return nil
  end

  private

  def sql_integrater(sql,params)
    DatabaseConnection.exec_params(sql,params)
  end

  def sql_to_item(product)
    item = Item.new(product['name'], product['price'], product['amount'])
    item.id = product['id']
    return item
  end
end
