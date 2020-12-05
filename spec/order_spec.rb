require "order"

RSpec.describe Order do
  subject(:order) { described_class.new }

  describe "initialized class" do
    it { expect(Order).to respond_to(:new) }

    it "expects order class to be initialized with empty hash" do
      expect(order.basket).to eq({})
    end
  end

  describe "#add_to_basket" do
    it { expect(order).to respond_to(:add_to_basket) }

    it "should add the item and quantity to the basket" do
      order.add_to_basket("Large Fish", 2)
      expect(order.basket).to eq("Large Fish" => 2)
    end
  end

  describe "#order_summary" do
    it { expect(order).to respond_to(:order_summary) }

    it "should print out the current selections and their quantities" do
      order.add_to_basket("Large Fish", 2)
      order.add_to_basket("Small Chips", 2)
      expect(order.order_summary).to eq("x2 Large Fish, x2 Small Chips")
    end
  end

  describe "#order_cost" do
    it { expect(order).to respond_to(:order_cost) }

    it "should calculate the total price" do
      order.add_to_basket("Large Fish", 2)
      order.add_to_basket("Small Chips", 3)
      order.order_cost
      expect(order.total).to eq(10.80)
    end

    it "should print the string 'Basket Total: £(cost)'" do
      order.add_to_basket("Large Fish", 2)
      order.add_to_basket("Small Chips", 3)
      expect(order.order_cost).to eq("Basket Total: £10.80")
    end
  end

  describe "empty_basket" do
    it { expect(order).to respond_to(:empty_basket) }

    it "should clear all items from the basket" do
      order.add_to_basket("Large Fish", 2)
      order.add_to_basket("Small Chips", 2)
      order.empty_basket
      expect(order.basket).to eq({})
    end
  end
end
