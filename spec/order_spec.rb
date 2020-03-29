require 'order'

describe Order do
  let(:menu)  { double :menu }
  let(:order) { Order.new}

  context "placing an order " do
    it "should allow the customer to place an order." do
      expect(order).to respond_to(:place_order)
    end
    it "should be able to calculate the correct total for the order" do
      expect(order.calculator([{"Carbonara" => 1}])).to eq 7
    end
  end
end
