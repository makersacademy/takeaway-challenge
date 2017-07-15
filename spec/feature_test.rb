require_relative '../lib/takeaway.rb'
require_relative '../lib/menu.rb'
require_relative '../lib/order.rb'

# view list of dishes with prices
# menu = Menu.new
# p menu.dishes
# p menu.print_menu
# thai = Takeaway.new
# p thai.view_menu

# order meal by selecting a number of dishes
# thai = Order.new
# thai.add_dish("Green Curry", 2)
# thai.add_dish("Pad Pak", 2)
# p thai.dishes
thai = Takeaway.new
p thai.view_menu
p thai.order("Green Curry", 2)
p thai.order("Rice", 2)
p thai.order("Singha", 2)
p thai.order("Pad Pak", 1)
p thai.view_order
