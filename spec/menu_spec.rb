require './lib/menu'
require './lib/order'

describe Menu do

  let(:menu)  { described_class.new(order) }
  let(:klass) { double(:klass) }
  let(:order) { double(:order) }

  before { allow(order).to receive(:new).and_return order }

  context "Initialization" do

    it "initializes with a list of food" do
      expect(menu.menu_list).not_to be_empty
    end

    it "accepts order object on initialization" do
      expect(menu.order).to eq order
    end

  end

  context "Menu" do

    it "can present a user with the list of food" do
      expect(menu.view_menu).to eq menu.menu_list
    end

    it "can present a price against a dish" do
      expect(menu.menu_list["spag_bol"]).to eq 6
    end

  end

  context "Selection" do

    it "can select an item to add to basket" do
      expect(menu).to respond_to(:select_item)
    end

    it "indicates when an item is not in the menu" do
      expect(menu.in_menu?("Peas")).to eq false
    end

    it "indicates when an item is on the menu" do
      expect(menu.in_menu?("spag_bol")).to eq true
    end

  end


end
