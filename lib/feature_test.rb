#require_relative "menu"
#require_relative "show_menu"
require_relative "order"
require_relative "confirm_order"

#m = Menu.new
o = Order.new
o.take_order
o.display_order
co = ConfirmOrder.new
co.confirm_order
