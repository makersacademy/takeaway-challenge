require_relative "menu.rb"
require_relative "order.rb"

order = Order.new
menu = Menu.new
menu.list_dishes()


#user_order = gets.chomp

user_order = ""
user_order_number = ""
until user_order == "finish"
  puts "what do you want to order"
  user_order = gets.chomp
  puts "how many portions do u want"
  user_order_number = gets.chomp
  order.take_order(user_order, user_order_number)
end





