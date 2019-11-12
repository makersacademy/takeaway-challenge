require 'menu'

describe Menu do

  # let(:item) { double :Item }

  it 'can create a new instance of a menu' do
    expect(subject).to be_instance_of Menu
  end

  it 'can add items to a menu list' do
    item1 = Item.new("item1", 5)
    item2 = Item.new("item2", 3)
    subject.add_item(item1)
    subject.add_item(item2)
    expect(subject.item_list).to eq [item1, item2]
  end

  it 'returns an error if an item added to a menu is not of Item class' do
    error = "test is not an Item class object"
    expect{ subject.add_item("test") }.to raise_error(error)
  end

  it 'can return a list of items and prices' do
    item1 = Item.new("item1", 5.25)
    item2 = Item.new("item2", 3.22)
    subject.add_item(item1)
    subject.add_item(item2)
    menulist = "item1  - £ 5.25\nitem2  - £ 3.22\n"
    expect(subject.view_menu).to eq menulist
  end
end
