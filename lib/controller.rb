class Controller

  def initialize
  end

  puts "Take-Away App"
  menu = DishList.new(Dish)
  menu.load
  order = Order.new(OrderLine)
  do until selection == "quit"
    puts "What would you like to do? enter:"
    puts "  S: to Show menu"
    puts "  O: to Create or add to an order"
    puts "  C: to cost and show current order"
    puts "  quit: to quit the app"
    option = gets.uppercase.chomp
    if option == "S"
      menu.see_menu
    elsif option == "O"
      order.create(menu)
    elsif option == "C"
      order.show
    elseif option == "QUIT"
      return
    else
      puts "Invalid option"
    end
  end
end
