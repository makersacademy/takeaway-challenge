require 'order.rb'

describe Order do 
  subject(:order) { described_class.new(takeaway_restaurant) }
  let(:takeaway_restaurant) { double :takeaway_restaurant }
  let(:item_1) { double :item_1 }
  let(:item_2) { double :item_2 }
  let(:item_3) { double :item_3 }

  it 'initializes with one argument' do
    expect { Order.new(takeaway_restaurant) }.not_to raise_error
  end

  it 'adds an item to its current order status' do
    order.add_item(item_1, 3)
    expect(order.current_items[0][0]).to eq item_1
  end
  
  it 'adds multiple items to its current order status' do
    order.add_item(item_1, 5)
    order.add_item(item_2, 3)
    order.add_item(item_3, 8)
    expect(order.current_items[1][0]).to eq item_2
  end

  it 'allows the user to submit the current_items' do
    this_order = Order.new(Restaurant.new)
    this_order.add_item(:chicken_curry, 5)
    expect(this_order.submit).to eq(9.50 * 5)
  end 



end


