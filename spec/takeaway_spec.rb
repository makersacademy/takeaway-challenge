require "takeaway"

describe Takeaway do

  let(:menu) { double }
  subject(:takeaway) { described_class.new(menu) }

  describe "menu" do

    it "can check the menu" do
      expect(takeaway.menu).to eq menu
    end
  end

  describe "#place_order" do

    it "places an order" do
      takeaway.place_order("spring rolls", 3)
      expect(takeaway.order).to include(["spring rolls", 3])
    end
  end
end
