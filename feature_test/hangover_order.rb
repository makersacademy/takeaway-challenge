require_relative "../lib/order.rb"
require_relative "../lib/dish.rb"
require_relative "../lib/menu.rb"

hangover_order = Order.new

tasty_dish = Dish.new("Scrambled Egg on Sourdough", 6.99)
hangover_order.add_order_items(tasty_dish, 2)

puts "#{hangover_order.items}"
hangover_order.remove_order_items(tasty_dish, 1)

puts "#{hangover_order.items}"
gross_dish = Dish.new("Sprouts", 0.55)

begin
  hangover_order.remove_order_items(gross_dish, 1)
rescue StandardError
  puts "correct error cannot remove dish not on order"
else
  puts "!! removed dish not on order"
end
puts "#{hangover_order.items}"

hangover_order.display



begin
  hangover_order.remove_order_items(tasty_dish, 2)
rescue StandardError
  puts "correct behaviour! error cannot order negative amount of dish"
else
  puts "!! set a negative amount of dish"
end
puts "#{hangover_order.items}"



hangover_order.display