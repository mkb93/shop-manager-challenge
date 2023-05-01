class Item
  attr_accessor :id, :name, :price, :amount
  def initialize(name, price, amount)
    @name = name
    @price = price
    @amount = amount
  end
end
