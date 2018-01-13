require "menu"

describe Menu do

  subject(:menu)     { described_class.new("test_menu.csv") }
  let(:printed_menu) { "1. test_dish" + "£10.00\n".rjust(21) }

  describe "#initialize" do
    it "creates an empty menu_items hash" do
      expect(menu.menu_items).to be_a(Hash)
    end
  end

  describe "#load_menu" do
    it "loads a file and assigns the dish to an instance variable" do
      expect(menu.dish).to eq("test_dish")
    end
    it "loads a file and assigns the price to an instance variable" do
      expect(menu.price).to eq(10.00)
    end
  end

  describe "#populate_menu_items" do
    it "loads a menu of dishes and prices from file" do
      expect(menu.menu_items["test_dish"]).to eq 10.00
    end
  end

  describe "#print" do
    it "prints the menu items" do
      expect { menu.print }.to output(printed_menu).to_stdout
    end
  end
end
