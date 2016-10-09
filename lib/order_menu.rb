require_relative './order_process'
require_relative './send_sms'
require 'dotenv'

Dotenv.load


class OrderMenu

  def interactive_menu
    loop do
      option_menu
      process(STDIN.gets.chomp)
    end
  end

  def option_menu
    puts "\nAvailible dishses:"
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

  def process(selection)
    case selection
    when "1"
      make_order
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

  def view_order
    return puts "\nNo dishes added to order yet!" unless defined? @new_order
    @new_order.pretty_food_list
  end

  def make_order
    system 'clear'
    @new_order = OrderProcess.new
    @new_order.new_order
  end

  def availible_dishes
    DishSelection.new.food_menu.each_value do
      |value| puts " #{value[0]}, £#{value[1]}0"
    end
  end

  def place_order
    return puts "\nYou have no dishes to be delivered!" unless defined? @new_order
    SendSms.new.message_customer
    puts "\nYour order has been placed"
  end
end
