require './lib/order.rb'

describe Order do
  subject(:order) {described_class.new}
  context "#select" do
    it "should add selected dishes to an price array" do
      order.select("Chicken")
      order.select("Fish")
      expect(order.order_price).to eq [1.00, 2.00]
    end
    it "should add selected dishes to a item array" do
      order.select("Chicken")
      order.select("Fish")
      expect(order.order_names).to eq ["Chicken", "Fish"]
    end
  end

  context "#correct_amount" do
    it "should add price of selected items and return to user" do
      order.select("Chicken")
      order.select("Fish")
      expect(order.price).to eq 3
    end
  end
end