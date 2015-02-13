require 'restaurant'

describe Restaurant do

  it "can receive an order" do
    restaurant = Restaurant.new
    order = double :order, total_price: 10
    expect{restaurant.take_order(order, 10)}.not_to raise_error
  end

  it "won't accept the order if full payment is not received" do
    restaurant = Restaurant.new
    order = double :order, total_price: 10
    expect{restaurant.take_order(order, 8)}.to raise_error
  end

  it "won't accept the order if too much payment is received" do
    restaurant = Restaurant.new
    order = double :order, total_price: 10
    expect{restaurant.take_order(order, 12)}.to raise_error
  end

end