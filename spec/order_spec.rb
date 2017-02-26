require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:takeaway) { double }

  describe "#initialize" do
    it "initializes with an empty current order hash" do
      expect(order.current_order.length).to eq(0)
    end
  end

  describe "#store_order", :st do
    it "stores the order in a hash" do
      expect{order.store_order("Charsui pork", 3)}.to change{order.current_order.length}.by(1)
    end
  end

  # describe "#" do
  #
  # end
end
