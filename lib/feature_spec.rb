require_relative 'takeaway'
require_relative 'menu'
require_relative 'dish'
require_relative 'order'

puts 'create a new takeaway restaurant:'
puts tims_takeout = Takeaway.new

puts 'create three dishes:'
puts dish1 = Dish.new(name: "Pad Thai", price: 5)
puts dish2 = Dish.new(name: "Dumplings", price: 7)
puts dish3 = Dish.new(name: "Cheesecake", price: 100)

puts 'add the dishes to the menu and show menu:'
tims_takeout.menu.add_dish(dish1)
tims_takeout.menu.add_dish(dish2)
tims_takeout.menu.add_dish(dish3)
puts tims_takeout.show_menu

puts 'place an order:'
puts tims_takeout.customer_order.place_order(dish1,dish2)

puts 'check total cost:'
puts tims_takeout.check_total
