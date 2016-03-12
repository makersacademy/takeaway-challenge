require_relative 'dish'
require_relative 'menu'

dish = Dish.new("Chicken Curry", 12.30)
menu = Menu.new

 menu

 dish

 dish.name
 dish.price
 dish.available
 "You ordered #{dish.name}, that will be #{'%.2f' % dish.price} pounds thank you"

menu.add_dish("Chicken Curry", 12.30)
menu.add_dish("Fish Curry", 11.30)
menu.add_dish("Lamb Curry", 13.30)
menu.add_dish("Fries", 2.30)
menu.add_dish("Salad", 7.30)
menu.add_dish("Naan", 3.30)
menu.add_dish("Pilau Rice", 1.30)
menu.add_dish("Plain Rice", 30)
menu.add_dish("Poppadom", 30)

p menu.dishes

print menu.show_menu
