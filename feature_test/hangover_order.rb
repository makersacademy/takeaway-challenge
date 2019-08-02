require_relative "../lib/order.rb"
require_relative "../lib/dish.rb"
require_relative "../lib/menu.rb"

hangover_order = Order.new

tasty_dish = Dish.new("Scrambled Egg on Sourdough", 6.99)
hangover_order.add_item(tasty_dish, 2)
hangover_order.remove_item(tasty_dish, 1)
gross_dish = Dish.new("Sprouts", 0.55)
begin
  handover_order.remove_item(gross_dish, 1)
rescue StandardError
  puts "correct error cannot remove dish not on order"
else
  puts "!! removed dish not on order"
end

begin
  handover_order.remove_item(tasty_dish, 2)
rescue StandardError
  puts "correct behaviour! error cannot order negative amount of dish"
else
  puts "!! set a negative amount of dish"
end
