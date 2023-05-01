require 'item_repository'

RSpec.describe ItemRepository do

  before(:each) do
    reset_table
  end
  it 'tests the all method' do
    item_repo = ItemRepository.new
    all = item_repo.all
    expect(all.length).to eq 2
    expect(all.first.name).to eq 'Item 1'
  end
  it 'tests the find method using the unique id' do
    item_repo = ItemRepository.new
    found = item_repo.find(1)
    expect(found.name).to eq 'Item 1'
  end
end