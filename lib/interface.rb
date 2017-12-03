class Interface

  def initialize(order_class = Order)
    @order = order_class.new
  end

  def print_interface
    puts "What would you like to do?"
    puts "1 - View the menu"
    puts "2 - Order something"
    puts "3 - Review your order"
    puts "4 - Confirm order"
    puts "5 - Cancel order"
  end

  def option_select
    option = gets.chomp
    case option
    when '1'
      @order.print_menu
      print_interface
      option_select
    when '2'
      add_to_order
    when '3'
      review_order
    when '4'
      confirm_order
    when '5'
      exit
    else
      puts "Thats not an option"
    end
  end

  def add_to_order
    puts "What would you like to order"
    item = gets.chomp
    puts "How many of #{item} would you like?"
    quantity = gets.chomp.to_i
    quantity.times do
      @order.request_item(item)
    end
    puts "Would you like to order anything else? Y/N"
    response = gets.chomp
    add_to_order if response.upcase == 'Y'
    print_interface
    option_select
  end

  def review_order
    @order.print_order
    puts "Would you like to order anything else? Y/N"
    response = gets.chomp
    add_to_order if response.upcase == 'Y'
    confirm_order
  end

  def confirm_order
    puts "Confirm order? Y/N"
    response = gets.chomp
    if response.upcase == 'Y'
      puts "text placeholder"
    else
      print_interface
      option_select
    end
  end

end
