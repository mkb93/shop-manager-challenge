require_relative 'lib/database_connection'
require_relative 'lib/item_repository'
require_relative 'lib/order_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('shop_inventory')

# # Perform a SQL query on the database and get the result set.
item_repo = ItemRepository.new
item_repo.all.each do |ab|
  puts ab.name
end
order_repo = OrderRepository.new
order_repo.all.each do |ab|
  puts ab.name
end
puts order_repo.find(1).name
