require 'order'

describe Order do

  menu = Menu.new
  subject { Order.new(menu) }

  it 'can create a new instance of order' do
    expect(subject).to be_instance_of(Order)
  end

  it 'can add an item to an order list' do
    item = Item.new("test", 1)
    menu.add_item(item)
    subject.add_item("test", 1)
    expect(subject.order_list).to eq [["test", 1]]
  end

  it 'checks that an item added is actually on the menu' do
    menu = Menu.new
    item = Item.new("item1", 1)
    menu.add_item(item)
    error = "Item not on menu"
    expect { subject.add_item("test", 1) }.to raise_error(error)
  end

end
