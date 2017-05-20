require './lib/order.rb'

order = Order.new
order.select_food(:bean_burger, 2)
order.select_food(:vegan_cheese_platter, 3)
puts order.select_food(:breaded_aubergine, 1)
