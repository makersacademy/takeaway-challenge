require "takeaway"

describe Takeaway do

  let(:menu) { double }
  subject(:takeaway) { described_class.new(menu) }

  describe "menu" do

    it "can check the menu" do
      expect(takeaway.menu).to eq menu
    end
  end

  describe "#add_to_order" do

    it "adds items" do
      takeaway.add_to_order("spring rolls", 3)
      takeaway.add_to_order("dumplings", 7)
      expect(takeaway.order).to eq({ "spring rolls" => 3, "dumplings" => 7 })
    end

    it "adds items twice" do
      takeaway.add_to_order("spring rolls", 3)
      takeaway.add_to_order("dumplings", 7)
      takeaway.add_to_order("spring rolls", 2)
      expect(takeaway.order).to eq({ "spring rolls" => 5, "dumplings" => 7 })
    end

    it "returns a message with the order" do
      takeaway.add_to_order("spring rolls", 3)
      takeaway.add_to_order("dumplings", 7)
      expect(takeaway.add_to_order("spring rolls", 2)).to eq "You just added '2 x spring rolls'. Your order so far is: '5 x spring rolls, 7 x dumplings'"
    end
  end

  describe "#get_total" do

    it "returns the total cost of the dishes in the order" do
      takeaway.add_to_order("spring rolls", 4)
      allow(menu).to receive(:dishes).and_return({ "spring rolls" => 2 })
      expect(takeaway.get_total).to eq 8
    end
  end
end
