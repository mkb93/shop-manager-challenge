class Order
  attr_accessor :id, :name, :date
  def initialize(name, date)
    @name = name
    @date = date
  end
end
