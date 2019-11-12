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
    expect(subject.item_list).to eq [["item1", 5], ["item2", 3]]
  end

end
