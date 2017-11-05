require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
    describe "#menu" do
      context "when requesting to see the menu" do
        it "should show the menu" do
          expect(takeaway.menu.list).to eq takeaway.menu.list
        end
      end
    end

    describe "#order" do
      context "when selecting a dish" do
        it "should be added to basket" do
          expect(takeaway.order("Chips")).to eq (takeaway.basket)
        end
      end
    end

    describe "#total" do
      context "when checking order total" do
        it "should return order total" do
          expect(takeaway.total).to eq takeaway.total
        end
      end
    end
end
