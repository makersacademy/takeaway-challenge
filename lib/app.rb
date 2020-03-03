require_relative 'menu'

menu = Menu.new

puts "Welcome to Definitely Real Burger Shop!\nHere is our menu:"

menu.print_menu

while true do
  print "You can type 'basket' to view your basket, 'confirm' to finalise your order, or 'quit' to exit\nPlease enter an order number:"
  input = gets.chomp
  order_number = input.to_i
  if input == 'basket'
    menu.print_basket
  elsif input == 'confirm'
    puts "Thank you, your food will be with you soon"
    break
  elsif input == 'quit'
    puts "Goodbye!"
    break
  elsif order_number > 0 && order_number <=menu.list.count
    menu.order(order_number)
    puts "1 x #{menu.list[order_number-1][:name]} added"
  else
    puts "Unrecognised command or item"
  end
end
