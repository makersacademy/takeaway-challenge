require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let(:menu) { double(:menu, print_menu: readable_menu) }
  let(:order) { double(:order, total: 74.00) }
  let(:readable_menu) { "Wings: £5.00" }
  let(:choices) { { wings: 5, pizza: 7 } }
  let(:sms) { double(:sms, delivery: nil) }

  before do
    allow(order).to receive(:add_to_order)
  end

  describe "#see_menu" do
    it "it displays a list of available food with prices" do
      expect(takeaway.see_menu).to eq(readable_menu)
    end
  end

  describe "#place_order" do
    it "it allows users to select some number of several available dishes" do
      expect(order).to receive(:add_to_order).twice
      takeaway.place_order(choices)
    end
  end

  describe "#order_total" do
    it "it returns a total cost for an order place by a user" do
      total = takeaway.place_order(choices)
      expect(total).to eq(74.00)
    end
  end

  it "it sends a text message when orders are placed" do
    expect(sms).to receive(:delivery)
    takeaway.place_order(choices)
  end
end
