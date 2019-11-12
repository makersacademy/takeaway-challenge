require 'order'

describe Order do

  it 'can create a new instance of order' do
    expect(subject).to be_instance_of(Order)
  end

  it 'can add an item to an order list' do
    subject.add_item("test", 1)
    expect(subject.order_list).to eq [["test", 1]]
  end

  it 'checks that an item added is actually on the menu' do
    menu = Menu.new
    item = Item.new("item1", 1)
    menu.add_item(item)
    error = "item not on menu"
    expect { subject.add_item("test", 1) }.to raise_error(error)
  end

end
