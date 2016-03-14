require_relative '../lib/restaurant'
require_relative '../lib/menu'
require_relative '../lib/order'
require_relative '../lib/sms'

menu = Menu.new
menu.load_menu
r = Restaurant.new menu
r.read_menu
r.order :pizza, 2
r.order :pasta
r.show_order
r.order_total
r.remove :pasta
