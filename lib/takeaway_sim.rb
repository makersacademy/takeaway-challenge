require_relative 'restaurant'

nickys = Restaurant.new(menu = {Chicken: 3, Beef: 4})
nickys.print_logo
while true do
  puts "Type M to see the menu, P to place an order"
  inp = gets.chomp
  break if inp == "M"
  break if inp == "P"
end
nickys.print_menu if inp == "M"
