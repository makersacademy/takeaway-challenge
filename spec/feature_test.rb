require './lib/menu'
require 'pry'

menu = Menu.new

p menu.contents

menu.show_menu


require './lib/order'

order = Order.new

order.choose(:fish, 1)
order.choose(:beef, 2)
order.choose(:rice, 2)
p order.selections

order.sum_total

p order.selections.last

order.complete_order(order.sum_total)
