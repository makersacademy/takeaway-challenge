require 'takeaway'

describe Takeaway do

  let(:qty) { double :qty }
  let(:menu) { double :menu, to_s: "menu string" }
  let(:order) { double :order, to_s: "order string", total: 12 }
  let(:sms_client) {double :sms_client}
  let(:menu_class) { double :menu_class, new: menu }
  let(:order_class) { double :order_class, new: order }
  subject(:takeaway) { described_class.new(order_class, menu_class) }

  describe "#order" do
    it "sends item and quantity to order" do
      expect(order).to receive(:add).with(instance_of(String),instance_of(Integer))
      takeaway.order("Spring rolls", 1)
    end

    it "returns the quantity of item in order" do
      allow(order).to receive(:add).with(any_args) {|p1, p2| p2} 
      expect(takeaway.order("Spring rolls", qty)).to eq qty
    end
  end

  describe "#order_summary" do
    it "returns order as a string" do
      expect(takeaway.order_summary).to eq "order string"
    end
  end

  describe "#check_total" do
    it "returns order total from order" do
      expect(takeaway.check_total).to eq 12
    end
  end

  describe "#submit" do
    it "instructs sms_client to send confirmation" do
      allow(sms_client). to receive_message_chain(:messages, :create)
      expect(Twilio::REST::Client).to receive(:new).and_return(sms_client)
      takeaway.submit_order
    end
  end
end