require "coffee_shop"
require "./data/menu_list"

describe CoffeeShop do
  describe "#read_menu" do
    it "should read out the menu items" do
      expect(subject.read_menu).to eq MENU
    end
  end
end
