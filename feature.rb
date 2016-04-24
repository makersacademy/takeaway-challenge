require_relative './lib/takeaway'
require_relative './lib/menu'
require_relative './lib/order_log'
require_relative './lib/menu_item'
require_relative './lib/sms'


special_menu = Menu.new

special_menu.add "beef lips", 7
special_menu.add "albatross wings", 5
special_menu.add "monkey balls", 6
special_menu.add "sheeps piss", 2

fergs_restaurant = Takeaway.new(special_menu)
puts fergs_restaurant.show

fergs_restaurant.add_to_order "beef lips", 2
puts fergs_restaurant.show("order")

fergs_restaurant.add_to_order "albatross wings", 3
fergs_restaurant.add_to_order "monkey balls", 3
fergs_restaurant.add_to_order "sheeps piss", 1
puts fergs_restaurant.show("order")

puts fergs_restaurant.checkout

puts fergs_restaurant.confirm_order 49
