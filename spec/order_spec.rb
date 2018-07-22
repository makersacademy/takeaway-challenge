require "order"
describe Order do
  subject(:order) { Order.new }

  describe "#initialize" do
    it "initializes with an empty order summary array" do
      expect(order.order_summary).to be_empty
    end
  end 
end  