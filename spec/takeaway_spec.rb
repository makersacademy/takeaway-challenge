require "takeaway"
require "menu"

describe Takeaway do
  subject(:takeaway_joint) {described_class.new}

    describe "#intialize" do
      it "has an empty order array" do
        expect(takeaway_joint.order_items).to be_empty
      end
      it "has an empty order array" do
        expect(takeaway_joint.order_cost).to be_empty
      end
    end

    describe "#menu_list" do
      it "returns the menu" do
        expect(takeaway_joint.menu_list).not_to be_nil
      end
    end

    describe '#place_order' do
      it "places menu item into order array" do
        takeaway_joint.place_order("hamburger")
          expect(takeaway_joint.order_items).to include("hamburger")
      end
      it "does raises an error if you order something not on the menu" do
        expect{ takeaway_joint.place_order "ham" }.to raise_error "Menu doesn't include this item"
      end
    end

  describe "#finalize_order" do
    it "returns how much the order costs" do
      takeaway_joint.place_order "hamburger"
      expect(takeaway_joint.finalize_order).to match("Your order comes to a total of £5. To place your order type charge_me(5)")
    end
  end

  describe "#charge_me" do
    it 'sends a payment confirmation text message' do
      expect(takeaway_joint).to receive(:charge_me)
      takeaway_joint.charge_me(20)
  end

    it "does raises an error if you try to pay the wrong amount" do
      takeaway_joint.place_order "hamburger"
      takeaway_joint.finalize_order
      expect{ takeaway_joint.charge_me(23) }.to raise_error "Not correct total"
    end
  end
end
