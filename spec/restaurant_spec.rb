require "restaurant"
require "menu"
describe Restaurant do

 let(:restaurant) { Restaurant.new }
 let(:menu) { Menu.new }

  context "on opening the program" do
    # Calling "load_menu" on restaurant instance creates a menu instance
    it "can load a menu" do
      restaurant.load_menu(menu)
      expect(restaurant.menu).to eq(menu)
    end

  end

  context "making an order" do
    # check restaurant instance has an order array
    it "has an array called order" do
      expect(restaurant.order).to be_a(Array)
    end
    # check order array is empty
    it "has an array called order which is empty" do
      expect(restaurant.order).to be_empty
    end
    # check can get a menu item from hash pushed to order array
    it "can choose an item from menu to order" do
      restaurant.load_menu(menu)
      dish = "char sui buns"
      ordered_dishes = {"char sui buns" => 1.00}
      expect(restaurant.choose(dish)).to eq ordered_dishes
    end

  end

end
