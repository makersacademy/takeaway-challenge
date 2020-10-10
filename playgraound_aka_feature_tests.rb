require_relative './lib/menu_item.rb'
require_relative './lib/menu.rb'
require_relative './lib/order.rb'
require_relative './lib/restaurant.rb'
rex = Restaurant.new
p rex
rarebit = rex.menu.items[0]
puts rex.show_menu
new_order = Order.new
new_order.order_item(rarebit, 2)
p new_order.order
