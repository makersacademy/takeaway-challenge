require 'order'
require 'menu'

describe Order do
  it "initializes with an empty @current_order" do
    order = Order.new
    expect(order.current_order).to eq []
  end

  it "initializes with an empty @prices_to_sum" do
    order = Order.new
    expect(order.prices_to_sum).to eq []
  end

  describe "#add_dish" do

    it "raises an error if #add_dish and it doesn't exist" do
      order = Order.new
      expect { order.add_dish("omelette") }.to raise_error("Sorry, that dish is not available")
    end

    it "can #add_dish to @current_order" do
      order = Order.new
      order.add_dish("Cheese Burger")
      expect(order.current_order).to include("Cheese Burger")
    end

    it "can add the price of the dish to @prices_to_sum" do
      order = Order.new
      order.add_dish("Cheese Burger")
      expect(order.prices_to_sum).to include(5)
    end
  end

  describe "#existent_dish?" do
    it "can check if #existent_dish in @menu" do
      order = Order.new
      expect(order.existent_dish?("Cheese Burger")).to eq true
    end
  end

  describe "#finish_order" do

    it "calculates the total amount to pay" do
    end

    it "prints a list with all the dishes and amount to pay" do
    end

  end
end
