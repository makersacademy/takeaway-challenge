require "order"
require "restaurant"

describe Order do
    subject(:order) { described_class.new }

  describe "#initialize" do
    it "should create an empty order list"
    expect(order.list).to be_empty
  end

  describe "#add" do
    it "should add item to the list"
    order.add("LENTIL RAGU")
    expect(order.list).to eq("LENTIL RAGU")
  end
end
