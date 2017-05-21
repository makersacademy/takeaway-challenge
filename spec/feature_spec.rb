require 'order'
require 'menu'

puts "FEATURE TEST:"
puts "-------------"

menu = Menu.new

menu.add_dish(Dish.new("Saag Paneer", "Cheesy Green Goodness", 4))
menu.add_dish(Dish.new("Saag Aloo", "Potatoey Green Goodness", 4))
menu.add_dish(Dish.new("Onion Bhaji", "Chopped onion, deep friend", 2))
menu.add_dish(Dish.new("Pahaari Aloo", "Spiced mashed potato with fried veg", 3))
menu.add_dish(Dish.new("Sheek Kebab", "Minced lamb marinated in spice", 5))
menu.add_dish(Dish.new("Seti Squid", "Delicious deep fried Squid", 3))
menu.add_dish(Dish.new("Yanam Gosth", "A slow cooked lamb dish", 7))
menu.add_dish(Dish.new("Sali Jaisalmar", "Tender chicken breast in creamy sauce", 7))
menu.add_dish(Dish.new("Mitho Tarkari", "Cottage cheese and baby potato", 8))
menu.add_dish(Dish.new("Passanda", "Finely sliced lamb cooked in sweet cream sauce", 7))
menu.add_dish(Dish.new("Hariyo Chicken", "Chicken breast cooked with fresh capsicum", 7))
menu.add_dish(Dish.new("Naga Chilli", "Edible napalm", 9))

order = Order.new(menu)

puts "MENU:"
puts "-----"
order.menu.list_dishes

order.select_dish(1)
order.select_dish(1)
order.select_dish("Saag Aloo")
order.select_dish(3)
order.select_dish("Pahaari Aloo")
# order.select_dish(50)
# order.select_dish("Big Mac")

puts "UNMODIFIED ORDER:"
puts "-----------------"

order.view_meal

order.remove_dish(1)
order.remove_dish("Pahaari Aloo")
# order.remove_dish(50)
# order.remove_dish("Big Mac")

puts "MODIFIED ORDER:"
puts "---------------"

order.view_meal

puts "CONFIRMATION:"
puts "-------------"

order.confirm_order
