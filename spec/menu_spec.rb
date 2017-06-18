
require_relative "../lib/menu"

describe Menu do

  subject(:menu) { described_class.new(menu_printer) }
  let(:menu_printer) { double(:menu_printer) }

  describe "attributes" do
    it { is_expected.to respond_to(:printer) }
    it { is_expected.to respond_to(:dishes) }

    context "on init" do
      describe "@menu_printer" do
        it "will default to my menu_printer class" do
          expect(menu.printer).to be menu_printer
        end
      end
    end
  end

  describe "#show_dishes" do
    it "tells the menu_printer to print dishes" do
      allow(menu_printer).to receive(:print_).with(menu.dishes)
      expect(menu_printer).to receive(:print_).with(menu.dishes)
      menu.show_dishes
    end
  end

  describe "#find" do
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
