require_relative 'dish_list_printer'
require_relative 'order'

class Takeaway
  include DishListPrinter

  def initialize(dishes:, order_class:)
    @dishes = dishes
    @order_class = order_class || Order
    @order = @order_class.new
  end

  def run
    print_welcome_screen
    print_menu
    get_user_selection
  end

  private 

  def print_welcome_screen
    puts "Welcome to Link's Wild Delivery!"
    puts "Here's the menu, please enter which items you'd like:"
  end

  def print_menu
    print_list(@dishes)
  end

  def get_user_selection
    choice = @dishes[gets.chomp.to_i - 1]
    @order.add(choice)
    print_confirmation
  end

  def print_confirmation
    puts "Added to order."
    puts "Anything else? Enter to finish adding items."
  end

end
