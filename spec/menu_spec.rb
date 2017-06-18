
require_relative "../lib/menu"
require_relative "../lib/food"

describe Menu do

  subject(:menu) { described_class.new(printer) }
  let(:resturant_food) { Menu::RESTAURANT_FOOD }
  let(:printer) { double(:printer) }

  describe "attributes" do
    context "@dishes" do
      context "on init" do
        it "defaults to resturant food" do
          expect(menu.dishes).to eq resturant_food
        end
      end
    end
  end

  describe "#show_dishes" do
    it "tells the printer to print dishes" do
      allow(printer).to receive(:print_all).with(menu.dishes)
      expect(printer).to receive(:print_all).with(menu.dishes)
      menu.show_food
    end
  end

  describe "#has?" do
    context "when dish passed in is not on the menu" do
      it "returns nil" do
        expect(menu.has?(:Truffles)).to be nil
      end
    end
    context "when dish passed in that is on the menu" do
      it "returns the item" do
        expect(menu.has?(:Pizza)).to eq [:Pizza, 10.0]
      end
    end
  end

end
