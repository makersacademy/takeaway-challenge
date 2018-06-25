require './lib/menu.rb'
require './lib/order.rb'

menu = Menu.new
menu.add_item('beef',3.25)
menu.add_item('curry',3)
menu.add_item('roast dinner',3.5)
menu.add_item('pork',3)
menu.add_item('fish and chips',3.17)
order = Order.new(menu)
