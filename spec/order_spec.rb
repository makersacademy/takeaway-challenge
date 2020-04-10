require "order"

describe Order do 

  subject(:order_instance) { described_class.new }

  describe "#add_item" do

    it "should add an item to the order array" do
      order_instance.add_item("Pizza")
      expect(order_instance.order).to eq(["Pizza"])
    end

  end
end
