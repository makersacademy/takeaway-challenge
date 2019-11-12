require 'order'

describe Order do

  menu = Menu.new
  item1 = Item.new("item1", 3)
  item2 = Item.new("item2", 2)
  menu.add_item(item1)
  menu.add_item(item2)
  subject { Order.new(menu) }

  it 'can create a new instance of order' do
    expect(subject).to be_instance_of(Order)
  end

  it 'can add an item to an order list' do
    subject.add_item("item1", 1)
    expect(subject.order_list).to eq [["item1", 1]]
  end

  it 'checks that an item added is actually on the menu' do
    error = "Item not on menu"
    expect { subject.add_item("test", 1) }.to raise_error(error)
  end

  it 'can return the cost of an item from the menu' do
    expect(subject.item_cost("item1")).to eq 3
  end

  it 'returns the total price for items in the order' do
    subject.add_item("item1", 1)
    subject.add_item("item2", 2)
    expect(subject.order_total).to eq(7.0)
  end

  it 'returns an error if attempting to place order with wrong amount' do
    subject.add_item("item1", 1)
    subject.add_item("item2", 2)
    error = "Incorrect total passed"
    expect{ subject.place_order(7.10) }.to raise_error(error)
  end

  it 'calculates a delivery time 1 hour from now' do
    timestring = '%02d' % (Time.now.hour + 1) +
      ":" + '%02d' % Time.now.min
    expect(subject.delivery_time).to eq(timestring)
  end

  # it 'can place an order if the correct total is passed' do
  #   subject.add_item("item1", 1)
  #   subject.add_item("item2", 2)
  #
  # end
end
