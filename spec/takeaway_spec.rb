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

    context "when correct total given" do
      it "adds a single item to the order" do
        allow(menu).to receive(:dishes).and_return({ "spring rolls" => 2 })
        takeaway.place_order("spring rolls", 3, 6)
        expect(takeaway.order).to eq({ "spring rolls" => 3 })
      end

      it "adds multiple items to the order" do
        allow(menu).to receive(:dishes).and_return({ "spring rolls" => 2, "dumplings" => 3  })
        takeaway.place_order("spring rolls", 3, "dumplings", 1, 9)
        expect(takeaway.order).to eq({ "spring rolls" => 3, "dumplings" => 1 })
      end
    end

    context "when incorrect total given and does not place the order" do
      it "raises an error" do
        allow(menu).to receive(:dishes).and_return({ "spring rolls" => 2 })
        expect { takeaway.place_order("spring rolls", 3, 5) }.to raise_error "The total is not correct and the order has not been placed!"
        expect(takeaway.order).to eq({})
      end
    end
  end

  describe "#get_total" do

    it "returns the total cost of the dishes in the order" do
      allow(menu).to receive(:dishes).and_return({ "spring rolls" => 2 })
      takeaway.place_order("spring rolls", 4, 8)
      expect(takeaway.get_total(["spring rolls", 4])).to eq 8
    end
  end

end
