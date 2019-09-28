require_relative 'dish_list_printer'
require_relative 'order'
require_relative 'dish'

class Takeaway
  include DishListPrinter

  def initialize(dishes, order_class=Order)
    @dishes = dishes
    @order_class = order_class
    @order = @order_class.new(ENV['TWILIO_TO'])
  end

  def run
    print_first_screen
    add_dishes
    print_second_screen
    manage_order
  end
  
  private 
  
  def print_first_screen
    puts "Welcome to Link's Wild Delivery!"
    puts "Here's the menu, please enter which items you'd like:"
    print_menu
  end
  
  def print_second_screen
    @second_menu = [
      "1.  Review Order",
      "2.  Add Items to Order",
      "3.  Check Total",
      "4.  Submit Order",
      "Please make a selection:"
    ]
    @second_menu.each { |item| puts item }
  end
  
  def print_menu
    print_list(@dishes)
  end

  def print_order
    @order.print_order
  end

  def manage_order
    choice = get_user_input(@second_menu.length)
    print_order if choice == 1
  end

  def add_dishes
    choice = get_user_input(@dishes.length)
    return if choice == ""

    add_to_order(choice)
    add_dishes
  end
  
  def add_to_order(selection)
    @order.add(@dishes[selection - 1])
    print_confirmation
  end

  def get_user_input(options)
    choice = gets.chomp
    return choice if choice.length == 0

    choice = choice.to_i
    return choice if (1..options).include?(choice)

    invalid_selection
    get_user_input(options)
  end

  def print_confirmation
    puts "Added to order."
    puts "Anything else? Enter to finish adding items."
  end
  
  def invalid_selection
    puts 'Invalid selection, try again or Enter to finish.'
  end
end
