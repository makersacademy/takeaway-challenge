require_relative 'takeaway'

puts 'create a new takeaway restaurant:'
puts tims_takeout = Takeaway.new

puts 'create three dishes:'
puts dish1 = Dish.new(name: "Pad Thai", price: 7)
puts dish2 = Dish.new(name: "Dumplings", price: 5)
puts dish3 = Dish.new(name: "Cheesecake", price: 3)

puts 'add the dishes to the menu and show menu:'
tims_takeout.menu.add_dish(dish1)
tims_takeout.menu.add_dish(dish2)
tims_takeout.menu.add_dish(dish3)
puts tims_takeout.show_menu

puts 'place an order:'
puts tims_takeout.customer_order.place_order(dish2, dish3)

puts 'check total cost:'
puts tims_takeout.check_total

puts 'the order was placed at this time:'
puts tims_takeout.customer_order.order_time

puts 'the order will be delivered at this time:'
puts tims_takeout.customer_order.delivery_time

puts 'send text message to confirm:'
tims_takeout.confirm_order
