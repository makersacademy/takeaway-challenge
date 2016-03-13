# us1
require './lib/menu.rb'
menu = Menu.new
menu.view
# Use symbols for keys
# Make menu a module

# US2
# Choose the number of the dish(optional)
require './lib/menu.rb'
require './lib/order.rb'
order = Order.new
Menu.new.view_contents

order.pick('Meat Biriyani', 1)
order.list

# restart
order.pick('Rougaye eggs', 4)
order.list

# restart
order.pick('Chicken noodles', 2)
order.pick('Broad beans curry and dal pouri', 3)
order.list

order.pick('Rougaye eggs', 3)
order.list

order.remove('Chicken noodles')
order.list

order.change('Rougaye eggs', 2)
order.change('Broad beans curry and dal pouri')

#US3
require './lib/menu.rb'
require './lib/order.rb'

order = Order.new
Menu.new.view_contents

order.pick('Meat Biriyani', 1)
order.pick('Rougaye eggs', 4)
order.pick('Chicken noodles', 2)
order.sub_total_orders
order.total_cost

#####

require './lib/menu.rb'
require './lib/order.rb'
require './lib/restaurant.rb'
restaurant = Restaurant.new
restaurant.show_menu
restaurant.place_order('Chicken noodles', 2)
restaurant.place_order('Rougaye eggs', 4)
restaurant.display_basket
restaurant.show_bill
