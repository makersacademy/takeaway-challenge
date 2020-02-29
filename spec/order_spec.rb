require 'order'
require 'menu'

describe Order do
  it "initializes with an empty @current_order" do
    order = Order.new
    expect(order.current_order).to eq []
  end

  it "initializes with a @total_price of 0" do
    expect(subject.pay_amount).to eq 0
  end

  it "can #add_dish to @current_order" do
    order = Order.new
    order.add_dish("Cheese Burger")
    expect(order.current_order).to include("Cheese Burger")
  end

  it "can check if #existent_dish in @menu" do
    order = Order.new
    expect(order.existent_dish?("Cheese Burger")).to eq true
  end

  it "raises an error if #add_dish and it doesn't exist" do
    order = Order.new
    expect { order.add_dish("omelette") }.to raise_error("Sorry, that dish is not available")
  end
end
