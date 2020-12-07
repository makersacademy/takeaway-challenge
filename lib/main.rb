require 'dotenv/load'
require_relative './dish.rb'
require_relative "./menu.rb"
require_relative './restaurant.rb'
require_relative './order.rb'

dish1 = Dish.new('pasta', "18")
dish2 = Dish.new('pizza', '20')
menu1 = Menu.new
menu1.add_dish(dish1)
menu1.add_dish(dish2)

restaurant = Restaurant.new(menu1)
puts restaurant.get_menu

order1 = Order.new
order1.order_dish("pizza")
order1.order_dish("pasta", 2)
order1.order_list

total_price = restaurant.take_order(order1)
puts total_price
expected_price = 10

return restaurant.confirm_order(ENV['CUSTOMER_PHONE_NUMBER']) if total_price == expected_price
return "Wrong total" if total_price != expected_price
