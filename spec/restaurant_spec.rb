require 'restaurant'

describe Restaurant do
  describe "@menu" do
    it "stores a list of foods" do
      menu_double = double :menu
      order_double = double :order
      restaurant = Restaurant.new(menu_double, order_double)
      expect(restaurant.menu).to eq menu_double
    end
  end

  describe "#view_menu" do
    it 'shows the user a menu of food and prices' do
      menu_double = double :menu, prettify_menu_list: "list of foods"
      order_double = double :order
      restaurant = Restaurant.new(menu_double, order_double)
      expect(restaurant.view_menu).to eq "list of foods"
    end
  end

  describe "#place_order" do
    it 'places an order' do
      order_double = double :order, order: "You added 4 hamburgers to your basket."
      restaurant = Restaurant.new(order_double)
      expect(restaurant.place_order("hamburger", 4)).to eq "You added 4 hamburgers to your basket."
    end
  end

  describe "#view_basket" do
    it 'shows orders in basket' do
      order_double = double :order, basket: ["hamburger (1): £1.99"]
      restaurant = Restaurant.new(order_double)
      restaurant.place_order("hamburger", 1)
      expect(restaurant.view_basket).to eq ["hamburger (1): £1.99"]
    end
  end
end
