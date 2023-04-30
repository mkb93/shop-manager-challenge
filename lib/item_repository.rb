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

  def find(item)

  end

  def create(item)

  end

  def delete(item)
    
  end

  private

  def sql_integrater(sql,params)
    DatabaseConnection.exec_params(sql,params)
  end

  def sql_to_item(product)
    item = Item.new
    item.id = product['id']
    item.name = product['name']
    item.price = product['price']
    item.amount = product['amount']
    return item
  end
end
