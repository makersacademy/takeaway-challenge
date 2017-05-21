require 'takeaway'

describe Takeway do

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
    expect(takeaway.create_order).to be_a(Order)
  end
end
