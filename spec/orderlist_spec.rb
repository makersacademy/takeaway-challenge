require 'orderlist'

describe OrderList do
  let(:order) { double :order }
  let(:order_class) { double :order_class, new: order}
  let(:kernel) { double :kernel }
  let(:menu) { double :menu }
  describe "#new_order" do
    it "creates a new order" do
      skip
    end

    it "pushes order notification to the customer" do
      skip
    end
  end
end