require_relative './lib/restaurant.rb'
require_relative './lib/menu.rb'
require_relative './lib/messenger.rb'

menu_1 = Menu.new
order_1 = Order.new(menu_1)


# order_1 = Order.new
# p order_1.add(3,"anchovies & diesel")
# p order_1.show_order
# p order_1.add(2,"venison sushi")
p order_1.orders
p order_1.add(2,"venison sushi")
p order_1.check_total
# p nandos.add_to_menu("apples & pears", 4.99)
# p order_1.menu
# p order_1.add(4,"apples & pears")
# p nandos.check_total
# p nandos.show_order
# p order.add(5,"venison sushi")
