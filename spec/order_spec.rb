require "order"
require "menu"

describe Order do

  let(:order) { described_class.new }
   let(:burger) { double(:burger, ["Burger", 5]) }

  describe "#initialize" do

    it "initialize with an empty order array" do
      expect(order.order).to be_empty
    end

  end

  describe "#add" do

    it "adds an item to the order" do
      order.add("Burger", 1)
      expect(order.order).to eq ([burger])
    end

    it "adds more than one item to the order" do
      order.add("Burger", 2)
      expect(order.order).to eq ([["Burger", 5], ["Burger", 5]])
    end

    it "raises an error if item not on the menu" do
      message = "Item not on menu."
      expect{order.add("Lamp", 1)}.to raise_error message
    end

  end

  describe "#remove" do
    before(:each) do
      order.add("Burger", 1)
      order.add("Pizza", 1)
    end

    it "removes an item from the order" do
      order.remove("Burger", 1)
      expect(order.order).to eq ([["Pizza", 8]])
    end

    it "removes multiple items from the order" do
      order.add("Burger", 1)
      order.remove("Burger", 2)
      expect(order.order).to eq ([["Pizza", 8]])
    end
  end

  describe "#total" do

    it "returns current total of the order" do
      order.add("Burger", 1)
      order.add("Pizza", 1)
      order.add("Burger", 1)
      message = "Current order total is £18"
      expect(order.total).to eq message
    end

  end

end
