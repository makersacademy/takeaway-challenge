
require_relative "../lib/takeaway"

describe Takeaway do

  subject(:takeaway) { described_class.new(menu, order, messenger) }

  let(:menu) { double(:menu) }
  let(:order) { double(:order) }
  let(:messenger) { double(:messenger) }

  describe "#show_menu" do
    it "asks the menu to show its dishes" do
      allow(menu).to receive(:show_food)
      expect(menu).to receive(:show_food)
      takeaway.show_menu
    end
  end

  describe "#add" do
    context "when user tries to order a dish not on menu" do
      it "fails with a descriptive message" do
        allow(menu).to receive(:has?).with(:Truffles).and_return(nil)
        expect { takeaway.add(:Truffles) }.to raise_error("That's not on the menu!")
      end
    end

    context "when user orders a dish on menu" do
      it "adds the dish to the order" do
        allow(menu).to receive(:has?).with(:Pizza).and_return([:Pizza, 10.0])
        expect(order).to receive(:add).with(:Pizza, 1)
        takeaway.add(:Pizza)
      end
    end
  end

  describe "#checkout" do
    context "when user pays too little" do
      it "fails with descriptive error message" do
        allow(order).to receive(:total).and_return(10.00)
        expect { takeaway.checkout(5.0) }.to raise_error("You're short. Please pay the correct sum man.")
      end
    end

    context "when user pays correct sum" do
      it "asks the messanger to send confirmation" do
        allow(order).to receive(:total).and_return(10.00)
        allow(messenger).to receive(:send_confirmation)
        expect(messenger).to receive(:send_confirmation)
        takeaway.checkout(10.00)
      end
    end

  end

  describe "summary" do
    it "asks the order to show its basket" do
      allow(order).to receive(:summary)
      expect(order).to receive(:summary)
      takeaway.summary
    end
  end

end
