require_relative 'order'

class OrderRepository
  def all
    sql = 'SELECT * FROM orders'
    result_array = DatabaseConnection.exec_params(sql,[])
    orders = []
    result_array.each do |product|
      order = Order.new
      order.id = product['id']
      order.name = product['name']
      order.date = product['HIREDATE']
      order.price = product['price']
      order.items = product['items']
      orders << order
    end
    return orders
  end
end
