require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new }

  it 'enables the customer to look at the menu' do
    dish = Dish.new("Lasagne", 7)
    takeaway.menu << dish
    expect(takeaway.menu).to include dish
  end
  it 'returns the menu in a readable list for the customer' do
    expect(takeaway.show_menu).to include "Curry -- £8"
  end
  it 'allows the customer to start creating an order from scratch' do
    expect(takeaway.order).to be_a(Order)
  end
  it 'allows the customer to add items onto the takeaway order' do
    takeaway.add_item_to_order("Curry")
    expect(takeaway.order.items[0]).to be_a(Dish)
  end
  it 'shows the order total when items added' do
    takeaway.add_item_to_order("Burger")
    expect(takeaway.order.total_cost).to eq 9
  end
  it 'shows the customer the order total' do
    takeaway.add_item_to_order("Burger")
    takeaway.add_item_to_order("Soup")
    expect(takeaway.order_total).to eq 15 + Takeaway::DELIVERY_PRICE
  end
end
