require 'order'

describe Order do
  let(:menu)  { double :menu }
  let(:order) { Order.new}

  context "placing an order " do
    it "should allow the customer to place an order." do
      expect(order).to respond_to(:place_order)
    end
    it "should be able to calculate the correct total for the order" do
      expect(order.send(:calculator,[{"Carbonara" => 1}])).to eq 7
    end
    it "should not let you input an invalid phone number" do
    end
    it "should make sure you're ordering items that are on the menu" do
    end
    it "should be able to take the quantity and estimated price in text form as well as just digits" do
    end
  end
end
