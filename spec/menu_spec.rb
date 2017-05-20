require "menu"

describe Menu do
subject(:menu) { described_class.new }

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
  describe "#list_of_dishes" do
    it "should show a list of dishes with the prices" do
      expect(menu.list_of_dishes).to eq({ chicken: 4.99, fish: 5.50, beef: 4.99, vegetarian: 4.50})
    end
  end

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes
  describe "#selection_of_dish" do
    it "should raise an error if the dish a user has chosen is not on the menu" do
      expect{ menu.selection_of_dish(dish) }.to raise_error "Dish not in menu: please select a dish from the menu"
    end
  end
end
