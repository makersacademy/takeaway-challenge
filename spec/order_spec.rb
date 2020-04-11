require "order"

describe Order do 

  subject(:order_instance) { described_class.new }

  describe "#add_food" do

    it "should add an item to the order array" do
      expect(order_instance.add_food("Chicken")).to eq(["Chicken"])
    end

    it "should add multiple items to the order array if a second argument is passed" do
      expect(order_instance.add_food("Fish", 2)).to eq(["Fish", "Fish"])
    end

    it "should add multiple items to the order array if a second argument is passed" do
      expect(order_instance.add_food("Sides", 4)).to eq(["Sides", "Sides", "Sides", "Sides"])
    end

  end
end
