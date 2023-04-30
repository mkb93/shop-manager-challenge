require_relative 'item'

class ItemRepository
  def all
    sql = 'SELECT * FROM items'
    result_array = DatabaseConnection.exec_params(sql,[])
    items = []
    result_array.each do |product|
      item = Item.new
      item.id = product['id']
      item.name = product['name']
      item.price = product['price']
      item.amount = product['amount']
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
end