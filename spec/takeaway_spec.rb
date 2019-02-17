require 'takeaway'

describe 'Takeaway' do

  it 'prints the menu for the customer to read ' do
    order_double = double :order
    order_class_double = double :Order, new: order_double
    takeaway = Takeaway.new
    allow(order_double).to receive(:sorted_by_name)
    expect(takeaway.read_menu). to eq takeaway.menu
  end

  it 'allows the customr to order food from the menu' do
    order_double = double :order
    order_class_double = double :Order, new: order_double
    takeaway = Takeaway.new
    allow(order_double).to receive(:sorted_by_name)
    allow(order_double).to receive(:select_dish)
    allow(order_double).to receive(:ordered_total)
    allow(order_double).to receive(:place_order)
    expect(takeaway.order_food("NACHOS", 2)).to eq "Thank you for your order. You will shortly receive a text."
  end
end
