require 'order'

describe Order do
  subject(:order) { described_class.new }

  describe "#add_to_order" do
    it "adds selection to basket" do
      order.add_to_order("sphagetti", 4)
      expect(order.basket).to eq "You added 4x sphagetti(s) to the basket"
    end
  end
end
