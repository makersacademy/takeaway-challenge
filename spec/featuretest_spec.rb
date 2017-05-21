require './lib/order.rb'

menu = Menu.new
menu.add_item(:breaded_aubergine, 5)
menu.add_item(:water, 0)
menu.add_item(:vegetable_pide, 5)
menu.add_item(:vegan_cheese_platter, 4)
menu.add_item(:jackfruit_burger, 8)

puts "Menu: #{menu.list}"

order = Order.new(menu)
order.select_food(:vegetable_pide, 2)
order.select_food(:vegan_cheese_platter, 3)
order.select_food(:breaded_aubergine, 1)

# puts "Total: #{order.show_total}"

order.select_food(:jackfruit_burger, 1)

order.end_order
