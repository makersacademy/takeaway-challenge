require_relative './dish_selection'
require_relative './send_sms'
require 'dotenv'
Dotenv.load

class OrderMenu

  def initialize
    @order = []
  end

  def option_menu
    puts "Availible dishses:"
    puts ""
    puts "    -_-_-_-_-_-_-"
    availible_dishes
    puts "    _-_-_-_-_-_-_"
    puts ""
    puts "press 1 to make a new order"
    puts "press 2 to view order and total"
    puts "press 3 place order"
    puts "press 4 to exit"
  end

  def interactive_menu
    loop do
      option_menu
      process(STDIN.gets.chomp)
     end
  end

  def process(selection)
    case selection
    when "1"
      new_order
    when "2"
      view_order
    when "3"
      place_order
    when "4"
      exit
    else
      puts "please select a valid option"
    end
  end

  def availible_dishes
    DishSelection.new.food_menu.each_value do
      |value| puts " #{value[0]}, £#{value[1]}0"
    end
  end

  def new_order
    dish_selection = DishSelection.new
    dish_selection.print_options_menu
    @order = dish_selection.order
  end

  def view_order
    puts "no dishes added yet" if @order.length < 1
    pretty_food_list
  end

  def pretty_food_list
    @order.each { |x| puts "#{x[0]},  £#{x[1]}0"}
    puts "Total order:          £#{total_order}0"
  end

  def total_order
    total = 0
    @order.each { |x| total += x[1] }
    total
  end

  def place_order
    SendSms.new.message_customer
    puts "Your order has been placed"
  end

end
