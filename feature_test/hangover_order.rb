require_relative "../lib/order.rb"
require_relative "../lib/dish.rb"
require_relative "../lib/menu.rb"

hangover_order = Order.new

tasty_dish = Dish.new("Scrambled Egg on Sourdough",6.99)
hangover_order.add(tasty_dish,2)
hangover_order.remove(tasty_dish,1)
gross_dish = Dish.new("Sprouts",0.55)
begin
  handover_order.remove(gross_dish,1)
rescue => exception
  puts "correct error cannot remove dish not on order"
else
  puts"!! removed dish not on order"
end


begin
  handover_order.remove(tasty_dish,2)
rescue => exception
  puts "correct behaviour! error cannot order negative amount of dish"
else
  puts"!! set a negative amount of dish"
end


