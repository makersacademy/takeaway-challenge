require './lib/order.rb'

menu = Menu.new
menu.add_item(:breaded_aubergine, 5)
menu.add_item(:water, 0)
menu.add_item(:bean_burger, 8)
menu.add_item(:vegan_cheese_platter, 4)

puts "Menu: #{menu.list}"

order = Order.new(menu)
order.select_food(:bean_burger, 2)
order.select_food(:vegan_cheese_platter, 3)
order.select_food(:breaded_aubergine, 1)

puts "Order taken: #{order.order_list}"

puts "Total: #{order.show_total}"

# order.end_order
