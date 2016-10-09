require_relative 'menu'
require_relative 'order'
require_relative 'validation'

class Interface

  def initialize(order_class = Order, validation_class = Validation, menu = Menu)
    @menu = Menu.new
    @order = order_class
    @validation = validation_class
  end

  require 'ap'
  require 'twilio-ruby'

  def main_menu
    loop do
      puts "*** Welcome to the takeaway ***"
      puts "Select from the following options:"
      puts "1: View the menu"
      puts "2: Make an order"
      puts "3: Exit"
      selection = gets.chomp
      case selection
      when "1"
        @menu.print_menu
      when "2"
        order_instance
        validation_instance # commented out attempt at dependency inversion
        @interface.select_dish
      when "3"
        terminate
      else
        "Please try again"
      end
    end
  end


  def select_dish
    @menu.print_menu
    puts "Enter the number of the dish you'd like to order"
    puts "If you've changed your mind, type 'exit'"
    dish_selection = gets.chomp
    @validation.validate_selection(dish_selection)
  end

  def select_quantity
    puts "How many would you like?"
    dish_quantity = gets.chomp.to_i
    @validation.validate_quantity(dish_quantity)
  end

  def return_order
    puts "So that's #{@current_selection[1]} x #{@menu.menu[@current_selection[0]]} costing £#{@current_selection[2].round(3)}"
    add_or_review
  end

  def add_or_review
    puts "To continue, please select one of the following options:"
    puts "1: Add to the order"
    puts "2: Review and confirm the order"
    selection = gets.chomp
    @validation.evaluate_input(selection)
  end

  def order_summary
    puts "ORDER SUMMARY:"
    @orders_array.each_with_index do |x,index|
      puts "#{index + 1}. #{x[1]} x #{@menu.menu[x[0]]}: £#{x[2]}"
    end
    puts "-----------"
    puts "TOTAL: £#{@running_total}"
    confirm_order
  end

  def confirm_order
    puts "To continue, please select one of the following options:"
    puts "1: Confirm the order"
    puts "2: Delete the order and start again"
    puts "3: Cancel the order"
    confirmation = gets.chomp
    @validation.confirmed?(confirmation)
  end

  def terminate
    puts "Thank you, goodbye"
    exit
  end

  private

  def order_instance
    @order = @order.new(@menu, self) #@order ||=
  end

  def validation_instance
    @validation = @validation.new(@order, @menu, self) #@validation ||=
  end

end
