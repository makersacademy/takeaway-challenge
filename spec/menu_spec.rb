require "menu"

RSpec.describe Menu do
  subject(:menu) { described_class.new }

  describe "#initialized menu" do
    it "has a list of items and prices" do
      expect(menu.menu_items).to eq Menu::MENU_ITEMS
    end
  end

  describe "#open_menu" do
    it "can call open_menu on menu" do
      expect(menu).to respond_to(:open_menu)
    end

    it "menu list to be printed on open_menu call" do
      expect(menu.open_menu).not_to be_empty
    end
  end

end
