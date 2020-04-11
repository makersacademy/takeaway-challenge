require "order"

describe Order do 

  subject(:order_instance) { described_class.new }

  describe "#add_food" do

    it "should add an item to the order array" do
      expect(order_instance.add_food("Pizza")).to eq(["Pizza"])
    end

  end
end
