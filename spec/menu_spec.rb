require 'menu'

describe Menu do
 subject(:menu) {described_class.new}
  describe "list of dishes" do
    it "displays a list of dishes" do
    dish = double("dish")
    price = double("price")
    expect(menu.display_dish).to eq (Menu::DISH_LIST)
    end
  end
end
