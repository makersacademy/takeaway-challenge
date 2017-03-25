require './lib/order'
require './lib/menu'
menu = Menu.new
menu.list
order = Order.new

require './lib/order'
order = Order.new
menu = Menu.new
order.select("Pancakes", 2)
order.select("Fries", 1)
order.select("Pizza", 3)
