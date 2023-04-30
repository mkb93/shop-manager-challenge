require "order_repository"

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
end
