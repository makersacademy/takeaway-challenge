require 'takeaway'

describe TakeAway do
  let(:menu) {double(:menu)}
  let(:order) { instance_double(Order) }
  subject(:takeaway) {described_class.new}

    describe "#see menu" do
      it "should allow to see the menu" do
        expect(takeaway.see_menu).to include(MENU.to_s)
      end
    end

    describe "#select" do
      before do
        allow(order).to receive(:add)
      end
      it "returns the basket items" do
        takeaway.select("Salad", 3)
        expect(takeaway.basket).to eq({"Salad"=>3})
      end
    end

    describe "#charge" do
      before do
        allow(order).to receive(:calc_total)
      end
      it "returns an integer represeting an amount to pay " do
        expect(takeaway.charge).to be_integer
      end
    end
end
