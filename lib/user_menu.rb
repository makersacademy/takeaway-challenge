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
    return  "Please Select An Option\n
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
      "Please select an option 1 - 5"
    end
  end

  def show_menu
    fm = FoodMenu.new
    puts fm.print
  end

  def order_food
    puts "Enter Menu Number and Qty"
    puts @food_order.take_order
  end

  def show_order
    puts "Here is What You Have Ordered"
    puts "-----------------------------"
    puts @food_order.show_orders
    puts "-----------------------------"
  end

  def show_total
    puts @total.calc(@food_order.orders)
<<<<<<< HEAD
=======
    @has_show_total_been
>>>>>>> a27ab571c0b6411d44008bb9ff1cb103a23313a4
  end

  def are_you_sure?
    @total.calc(@food_order.orders)
    if @total.total_cost.zero?
      puts "You haven't ordered anything"
    else
      puts "Are you sure you are ready to finalise your order?"
      input = gets.chomp
      if input == "yes"
        puts "Thank You for your order! You should receive text confirmation shortly"
        done = PlaceOrder.new(@total.total_cost)
        done.send_text
      end
    end
  end

end

#um = UserMenu.new
#um.print_options
