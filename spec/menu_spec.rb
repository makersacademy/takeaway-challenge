require_relative '../lib/menu'

describe Menu do

  let(:menu_input) { "Curry,6.50\nSpagbol,7.50\nCottage Pie,8" }
  subject(:menu) { described_class.new (menu_input) }

  let(:formatted_menu) { "Curry, Price: £6.50\nSpagbol, Price: £7.50\nCottage Pie, Price: £8.00" }

  describe "#show_menu" do
    it "shows what is on the menu" do
      expect(menu.show_menu).to eq formatted_menu
    end
  end

  describe "#select_dish" do
    it "selects a dish from the menu" do
      expect(menu.select_dish("Spagbol").name).to eq "Spagbol"
    end
  end

end
