require 'order_manager'

describe Order_manager do
  let(:order_klass) { double :order_klass, new: order }
  let(:order) { double :order }
  let(:custID) { "John" }
  let(:request) { " XXX - 5, total - 1"}

  describe "#pull_text_orders" do
    it "pulls the texts from twilio" do
      expect(subject.pull_text_orders).to be_a Array
    end
  end
  describe "#new_order" do
    it "adds an order" do
      expect(subject.new_order(custID, request, order_klass)).to eq order
    end
  end
end
