require 'order.rb'

describe Order do 
  subject(:order) { described_class.new }

  it 'can create an order' do
    expect { Order.new }.not_to raise_error
  end

  it 'can add an item to the menu' do
    expect { order.add_item("chicken curry", 4) }.not_to raise_error
  end

  it 'can show the current items in the order' do
    order.add_item("chicken curry", 4)
    expect(order.current_items[0]).to eq ["chicken curry", 4]
  end

  it 'can store more than 1 item in its current items' do
    order.add_item("Pork Belly", 6)
    order.add_item("Chicken Curry", 5)
    order.add_item("Beef Curry", 3)
    expect(order.current_items.length).to eq 3
  end

end