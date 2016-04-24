require './lib/order.rb'

order = Order.new
order.add "Koteletai"
order.add "Koteletai"
order.add "Burukeliu Sriuba"
order.view_order
order.remove "Koteletai"
