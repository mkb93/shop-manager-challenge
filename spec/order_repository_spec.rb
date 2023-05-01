require "order_repository"
require "order"

RSpec.describe OrderRepository do

  before(:each) do
    reset_table
  end
  it 'tests the all method' do
    order_repo = OrderRepository.new
    all = order_repo.all
    expect(all.length).to eq 2
    expect(all.first.name).to eq 'Order 1'
  end
  it 'tests the find method using the unique id' do
    order_repo = OrderRepository.new
    all = order_repo.find(1)
    expect(all.name).to eq 'Order 1'
  end
  it 'tests the create method by adding another order' do
    order_repo = OrderRepository.new
    order = Order.new('Order 3', '3000-10-30')
    order_repo.create(order)
    all = order_repo.all
    expect(all.length).to eq 3
  end
  it 'tests the delete method by adding another order then removing it' do
    order_repo = OrderRepository.new
    order = Order.new('Order 3', '3000-10-30')
    order_repo.create(order)
    all = order_repo.all
    expect(all.length).to eq 3
    expect(all.last.id).to eq '3'
    order_repo.delete(order)
    expect(order_repo.all.length).to eq 2
  end
  it 'tests updates of a incorrectly inputted item' do
    order_repo = OrderRepository.new
    order = Order.new('Order 4', '4000-10-10')
    order_repo.create(order)
    order_update = Order.new('Order 3', '3000-10-30')
    order_update.id = '3'
    order_repo.update(order_update)
    expect(order_repo.all.last.name).to eq 'Order 3'
  end
end
