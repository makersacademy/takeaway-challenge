require_relative "menu.rb"
require_relative "order.rb"

order = Order.new
menu = Menu.new
calulator = Calulator.new
menu.list_dishes()


user_order = ""
user_order_number = ""
until user_order == "finish"
  puts "what do you want to order? say checkout to pay or say finish to stop the program"
  user_order = gets.chomp

  if user_order == "finish"
    break
  end

  if user_order == "checkout"
    x = calulator.calculateOrder(order.basket)
    puts " d"
    break
  end


  puts "how many portions do u want"
  user_order_number = gets.chomp
  order.take_order(user_order, user_order_number)
end





