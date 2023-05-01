require 'item_repository'
require 'item'

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
  it 'tests the create method by adding another item' do
    item_repo = ItemRepository.new()
    item = Item.new('Item 3', 30, 30)
    item_repo.create(item)
    all = item_repo.all
    expect(all.length).to eq 3
    expect(all.first.name).to eq 'Item 1'
  end
  it 'tests the delete method by adding another order then removing it' do
    item_repo = ItemRepository.new
    item = Item.new('Item 3', 30, 30)
    item_repo.create(item)
    all = item_repo.all
    expect(all.length).to eq 3
    expect(all.last.id).to eq '3'
    item_repo.delete(item)
    expect(item_repo.all.length).to eq 2
  end
  it 'updates the information on the item' do
    item_repo = ItemRepository.new
    item = Item.new('Item 4', 40, 40)
    item_repo.create(item)
    item_update = Item.new('Item 3', 30, 30)
    item_update.id = '3'
      item_repo.update(item_update)

    expect(item_repo.all.last.name).to eq 'Item 3'
  end
end