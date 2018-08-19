require 'order_manager'

describe Order_manager do
  let(:order_klass) { double :order_klass, new: order }
    let(:order_klass2) { double :order_klass, new: order2 }
  let(:order) { double :order, count: 1, total: 1, number: 12345 }
  let(:order2) { double :order, count: 1, total: 2, number: 12345 }
  let(:custID) { "John" }
  let(:request) { " XXX - 5, total - 1"}
  let(:message) {double :message, send_confirmation: true}
  let(:number) { 12345 }

  describe "#pull_text_orders" do
    it "pulls the texts from twilio" do
      expect(subject.pull_text_orders).to be_a Array
    end
  end
  describe "#new_order" do
    it "adds an order" do
      expect(subject.new_order(custID, number, request, order_klass)).to eq order
    end
  end
  describe "#confirm_order" do
    it "sends a message to confirm the order if totals match" do
      subject.new_order(custID, number, request, order_klass)
      expect(subject.confirm("John", message)).to eq true
    end
    it "won't send a message to confirm the order if totals don't match" do
      subject.new_order(custID, number, request, order_klass2)
      expect(subject.confirm("John")).to eq false
    end
  end
end
