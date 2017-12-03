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
      print_and_select
    end
  end

  def add_to_order
    item = get_food
    get_quantity.times { @order.request_item(item) }
    add_to_order if yes?(more_food)
    print_and_select
  end

  def review_order
    @order.print_order
    add_to_order if yes?(more_food)
    confirm_order
  end

  def confirm_order
    yes?(finish_order) ? (puts "text placeholder"; exit) : print_and_select
  end

  def print_and_select
    print_interface
    option_select
  end

  def more_food
    puts "Would you like to order anything else? Y/N"
    response = gets.chomp.upcase
  end

  def get_food
    puts "What would you like to order"
    gets.chomp
  end

  def get_quantity
    puts "How many of that would you like?"
    gets.chomp.to_i
  end

  def yes?(question)
    question == 'Y'
  end

  def finish_order
    puts "Confirm order? Y/N"
    gets.chomp.upcase
  end

end
