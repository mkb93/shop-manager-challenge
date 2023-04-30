require "order_repository"

RSpec.describe OrderRepository do
  def reset_table
    seed_sql = File.read('spec/seeds_orders.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'shop_inventory_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_table
  end
  it 'tests the all method' do
    order_repo = OrderRepository.new
    all = order_repo.all
    expect(all.length).to eq 2
    expect(all.first.name).to eq 'Order 1'
    expect(all.first.price).to eq '15'
  end
  it 'tests the find method using the unique id' do
    order_repo = OrderRepository.new
    all = order_repo.find(1)
    expect(all.name).to eq 'Order 1'
    expect(all.price).to eq '15'
  end
end
