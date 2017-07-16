require './lib/dish.rb'
require './lib/order.rb'
require './lib/restaurant.rb'
require './lib/menu.rb'

describe "feature tests" do

  let(:menu_dish1) { Dish.new("Burrito", 5) }
  let(:menu_dish2) { Dish.new("Pizza", 10) }
  let(:menu_dish3) { Dish.new("Burger", 15) }
  let(:menu_list) { [menu_dish1, menu_dish2, menu_dish3] }
  let(:unserved_dish) { Dish.new("FREE HAGGIS", 0) }
  let(:restaurant) { Restaurant.new(Menu.new(menu_list), Order.new) }





end
