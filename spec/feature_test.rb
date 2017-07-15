require_relative '../lib/takeaway.rb'
# require_relative '../lib/menu.rb'
# view list of dishes with prices
# menu = Menu.new
# p menu.dishes
# p menu.print_menu

thai = Takeaway.new
p thai.view_menu

# => list of items

# order meal by selecting a number of dishes
# thai = Menu.new
# thai.view_menu
# order = Order.new
# order("Green Curry", 2)
# order("Rice", 2)
# order("Singha", 2)
# order("Pad Pak", 1)
# order.view
