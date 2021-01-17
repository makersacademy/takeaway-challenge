require_relative 'order'
require_relative 'dish_filter'

class Takeaway

  def initialize(menu, order_class = Order)
    @menu = menu
    @order_class = order_class
  end

  def show_menu
    puts @menu.pretty_dishes
  end

  def add_order
    @current_order = @order_class.new if @current_order == nil

    got_dish = select_dish

    if got_dish == nil
      puts "Invalid Dish"
      return
    end

    quantity = select_quantity
    @current_order.add_dish(got_dish, quantity)
  end

  def prompt
    puts "Select an option:\n1.\tMenu\n2.\tOrder\n9.\tExit"

    user_input = gets.chomp

    case user_input
    when "1"
      show_menu
    when "2"
      add_order
    when "9"
      exit 0
    else
      puts "Please select a valid option"
    end
  end

  private

  def select_dish
    puts "Please input a dish id"
    user_input = gets.chomp
    @menu.get_dish(user_input.to_i)
  end

  def select_quantity
    puts "How many would you like?"
    user_input = gets.chomp
    user_input.to_i
  end

end
