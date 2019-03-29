require_relative 'food_menu'
require_relative 'order'
require_relative 'total'
require_relative 'place_order'

class UserMenu

  def initialize
    @food_order = Order.new
    @total = TotalCost.new
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
      puts "Showing Total Cost of Order"
      return show_total
    elsif option == "5"
      puts "Finalise Your Order"
      return are_you_sure?
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
    puts "-----------------------------"
    puts @food_order.show_orders
    puts "-----------------------------"
    print_options
  end

  def show_total
    puts @total.calc(@food_order.orders)
    print_options
  end

  def are_you_sure?
    puts "Are you sure you are ready to finalise your order?"
    input = STDIN.gets.chomp
    if input == "yes"
      done = PlaceOrder.new(@total.total_cost)
      done.send_text
      return "Thank You for your order! You should receive text confirmation shortly"
    else
      print_options
    end
  end

end

um = UserMenu.new
um.print_options
