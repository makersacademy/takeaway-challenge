require "order"
describe Order do
  subject(:order) { Order.new }

  describe "#initialize" do
    it "initializes with an empty order summary array" do
      expect(order.summary).to be_empty
    end

    it "initializes total equal to zero" do
      expect(order.total).to eq 0
    end
  end
  
  describe "#add" do
    it "adds a dish and quantity to the order summary" do
      
    end
  end

  describe "#total" do
    it "returns sum of all dishes in the summary" do
      order.add("meat", 5 )
      expect(order.total).to eq 50
    end
  end 
end  