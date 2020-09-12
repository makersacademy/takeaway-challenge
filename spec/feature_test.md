require './lib/order.rb'
order = Order.new
order.add("Prawn Crackers")
order.add("Dumplings")
order.add("Pepperoni Pizza")
order.remove("Pepperoni Pizza")
order.add("Singapore Noodles")
order.list
order.confirm

require './lib/menu.rb'
menu = Menu.new
menu.select("pizza")

