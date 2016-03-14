require "menu"

describe Menu do
  subject(:menu) { described_class.new }
  let(:menu_item) { double :cheese_sandwich }
  let(:menu_item_price) { 3 }

  describe "#add_to_menu" do
    it "should add item to menu hash" do
      menu.add_to_menu(menu_item,menu_item_price)
      expect(menu.list).to include menu_item => menu_item_price
    end
  end

  describe "#price" do
    it "should return price of item" do
      menu.add_to_menu(menu_item,menu_item_price)
      expect(menu.price(menu_item)).to eq menu_item_price
    end
  end
end
