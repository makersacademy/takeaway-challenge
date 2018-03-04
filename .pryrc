require './lib/takeaway.rb'
require './lib/order.rb'
require './lib/menu.rb'
menu = Menu.new({'margherita' => 4, 'capricciosa' => 4.50})
order = Order.new(menu)
