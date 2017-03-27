require './lib/order'
require './lib/menu'
menu = Menu.new
menu.list
order = Order.new

require './lib/takeaway.rb'
t = Takeaway.new
t.read_menu
t.order("Pizza", 2)

require './lib/order.rb'
order = Order.new



order.select("Pancakes", 2)
order.select("Fries", 1)
order.select("Pizza", 3)
