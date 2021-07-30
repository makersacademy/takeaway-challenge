require './lib/menu.rb'

x = Takeaway.new
x.show_menu
x.select_meal("burger")
x.calculate_fee
x.order_total