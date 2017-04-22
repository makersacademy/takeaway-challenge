require 'order'

describe Order do
subject(:order) {Order.new}

  describe "#place order" do
    it "should allow a customer to place an order" do
      expect(order.add_items_to_order("Pizza", 1)).to eq([{}])
    end
  end

end
