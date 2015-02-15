require 'order'
require_relative 'spec_helper'

describe Order do

  let(:order) {Order.new}

  it "can have a dish added to the current order" do
    dish = double :dish
    order.add_to_order(dish)
    expect(order.current_order).to include(dish)
  end

  it "has a quantity specified for each item in the order" do
    dish = double :dish
    order.add_to_order(dish, 2)
    expect(order.current_order).to include(dish => 2)
  end

  it "knows the total price of the order" do
    dish1 = double :dish, price: 4
    dish2 = double :dish, price: 2
    order.add_to_order(dish1, 2)
    order.add_to_order(dish2, 1)
    expect(order.total_price).to eq(10)
  end

end