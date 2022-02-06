require_relative '../lib/takeaway'

describe Takeaway do
  subject(:takeaway){ described_class.new(menu) }
  let(:menu){ double("menu") }
  let(:order){ double("order") }

  it "has a menu" do
    expect(takeaway.menu).to eq menu
  end

  context "ordering" do
    it "starts an order" do
      expect(takeaway.start_new(order)).to eq order
    end
  end

end
