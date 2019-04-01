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
    loop do
      puts options
      process_menu_selection(gets.chomp)
    end
  end

  def options
    return  "\nPlease Select An Option\n
    1. Show Menu
    2. Order
    3. Show Order
    4. Total Cost
    5. Place Order
    "
  end

  def process_menu_selection(option)
    if option == "1"
      puts "Showing Menu"
      show_menu
    elsif option == "2"
      puts "Order Your Meal"
      order_food
    elsif option == "3"
      puts "Showing Your Order"
      show_order
    elsif option == "4"
      puts "Showing Total Cost of Order"
      show_total
    elsif option == "5"
      puts "Finalise Your Order"
      are_you_sure?
    elsif option == "exit"
      exit
    else
      return "\nPlease select an option 1 - 5"
    end
  end

  def show_menu
    fm = FoodMenu.new
    puts fm.menu_options
    return "menushown"
  end

  def order_food
    puts "Enter Menu Number"
    puts @food_order.take_order
    return "orderfood"
  end

  def show_order
    puts "Here is What You Have Ordered"
    puts "-----------------------------"
    puts @food_order.show_orders
    puts "-----------------------------"
    return "option3"
  end

  def show_total
    puts @total.calc(@food_order.orders)
    return "totalprinted"
  end

  def are_you_sure?
    @total.calc(@food_order.orders)
    if @total.total_cost.zero?
      puts "You haven't ordered anything"
      return "You haven't ordered anything"
    else
      puts "Are you sure you are ready to finalise your order?"
      input = gets.chomp
      if input == "yes"
        puts "Thank You for your order! You should receive text confirmation shortly"
        done = PlaceOrder.new(@total.total_cost)
        done.send_text
        exit
      end
    end
  end

end

#um = UserMenu.new
#um.print_options
