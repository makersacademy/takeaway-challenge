require "takeaway"
require "menu"

describe Takeaway do




    describe "#intialize" do
      it "has an empty order array" do
        expect(subject.order).to be_empty
      end

    end

    describe "#menu_list" do
      it "returns the menu" do
        expect(subject.menu_list).not_to be_nil
      end
    end

    describe '#place_order' do
      it "places menu item into order array" do
        subject.place_order("hamburger")
          expect(subject.order).to include("hamburger")
      end
      it "searches menu for a matching item" do
        subject.place_order("hamburger")
        expect(subject.order).to match("Hamburger")
    end
  end

end
