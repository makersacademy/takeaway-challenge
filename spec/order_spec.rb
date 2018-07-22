require "order"
describe Order do
  subject(:order) { Order.new }

  describe "#initialize" do
    it "initializes with an empty order summary array" do
      expect(order.summary).to be_empty
    end
  end
  
  describe "#add" do
    it "adds a dish and quatity to the order summary" do
      order.add_dish("meat")
      expect(order.summary).to include("meat")
    end
  end 
end  