require './lib/takeaway'
require './lib/menu'
require './lib/dish'

menu = Menu.new
menu.add_dish(Dish.new("Lamb Biryani", 4.99))
menu.add_dish(Dish.new("Chicken Malaya", 4.50))
menu.add_dish(Dish.new("Popadums", 1.00))
my_restaurant = Takeaway.new(menu)
print my_restaurant.menu

my_restaurant.order({"Popadums" => 2}, 2.00)
