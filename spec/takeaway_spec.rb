require_relative '../lib/takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu) }
  let(:menu) { double("menu") }
  let(:order) { double("order") }

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
      takeaway.confirm
      expect(takeaway.send_delivery).to eq
    end

  end

end
