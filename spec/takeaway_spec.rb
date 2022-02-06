require_relative '../lib/takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double("menu") }
  let(:order) { double("order") }
  let(:message) { double("message") }

  it "has a menu" do
    expect(takeaway.menu).to eq menu
  end

  context "ordering" do
    it "starts an order" do
      expect(takeaway.start_new(order)).to eq order
    end
    it "raises an error if no order started" do
      expect {takeaway.confirm }.to raise_error "No current order."
    end
    it "confirms an order" do
      allow(order).to receive(:complete?) { true }
      takeaway.start_new(order)
      expect(takeaway.confirm).to eq true
    end
  end

  context "delivery" do
    it "sends a message" do
      takeaway.start_new(order)
      allow(order).to receive(:complete?) { true }
      takeaway.confirm
      allow(message).to receive(:send) { "Sent" }
      expect(takeaway.send_delivery(message)).to eq "Sent"
    end

  end

end
