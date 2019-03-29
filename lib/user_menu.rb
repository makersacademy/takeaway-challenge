require_relative 'food_menu'
require_relative 'order'

class UserMenu

  def initialize
    @food_order = Order.new
  end

  def print_options
    puts options
    process_menu_selection(STDIN.gets.chomp)
  end

  def options
  return "Please Select An Option\n
  1. Show Menu\n
  2. Order\n
  3. Show Order\n
  4. Total Cost\n
  5. Place Order\n
  "
  end

  def process_menu_selection(option)
    if option == "1"
      puts "Showing Menu"
      return show_menu
    elsif option == "2"
      puts "Order Your Meal"
      return order_food
    elsif option == "3"
      puts "Showing Your Order"
      return show_order
    elsif option == "4"
      return "Showing Total Cost of Order"
    elsif option == "5"
      return "Finalise Your Order"
    elsif option == "exit"
      exit
    else
      "Please select an option 1 - 4"
      print_options
    end
  end

  def show_menu
    fm = FoodMenu.new
    puts fm.print
    print_options
  end

  def order_food
    puts "Enter Menu Number and Qty"
    puts @food_order.take_order
    print_options
  end

  def show_order
    puts "Here is What You Have Ordered"
    puts @food_order.show_orders
    print_options
  end

end

#um = UserMenu.new
#um.print_options
