require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
    describe "#menu" do
      context "when requesting to see the menu" do
        it "should show the menu" do
          expect(takeaway.menu).to eq takeaway.menu
        end
      end
      context "when selecting a dish" do
        it "should be added to basket" do
          expect{ takeaway.order(dish) }.to change { takeaway.basket }.by(1)
        end
      end
    end
end
