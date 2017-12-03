class Interface

  def initialize(order_class = Order)
    @order = order_class.new
  end

  def print_interface
    puts "What would you like to do?"
    puts "1 - View the menu"
    puts "2 - Order something"
    puts "3 - Review your order"
    puts "4 - Cancel order"
  end

  def option_select
    option = gets.chomp
    case option
    when '1'
      @order.print_menu
    when '2'
      #add to order
    when '3'
      #review order
    when '4'
      exit
    else
      puts "Thats not an option"
    end

  end

end
