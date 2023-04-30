class Order
  attr_accessor :id, :name, :date, :price, :items
  def initialize
  @items = []
  end
end