require "order"
require "restaurant"

describe Order do
    subject(:order) { described_class.new }
    let(:food) { "LENTIL RAGU" }
    let(:amount) { 2 }

  describe "#initialize" do
    it "should create an empty order basket" do
      expect(order.basket).to be_empty
    end
  end

  describe "#add" do
    it "should add item to the basket" do
      expect { order.add(food, amount) }.to change { order.basket[food] }.by quantity
    end
  end
end
