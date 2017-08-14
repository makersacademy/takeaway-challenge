require_relative 'foodmenu'
require_relative 'sendtext'
require_relative 'order'
require_relative 'settime'

class Run
  attr_reader :total

  def initialize
    @order = Order.new
    @texter = TwilioController.new
  end

  def interactive_menu
    loop do
      print_menu
      process(STDIN.gets.chomp)
    end
  end

  def print_menu
    welcome
    puts "1. View the food menu"
    puts "2. Take order"
    puts "3. Check total"
    puts "4. Checkout"
    puts "0. Exit"
  end

  def process(selection)
    return view_food_menu if selection == "1"
    return take_order if selection == "2"
    return check_total if selection == "3"
    return checkout if selection == "4"
    return exit if selection == "0"
    puts "I don't know what you meant. Try again."
  end

  def welcome
    puts "Welcome to Makers Sushi!  Please pick one of the options below:"
  end

  def view_food_menu
    @order.display_menu
    puts "Would you like to order? Y/N"
    return take_order if STDIN.gets.chomp == "Y"
  end

  def take_order
    @order.take_order
  end

  def check_total
    @order.check_total
  end

  def checkout
    settime = SetTime.new
    message = "Thanks! Your order will be delivered before #{settime.hr1}:#{settime.min1} today"
    @texter.send_text_message(message)
    puts "Your order is placed!  Please check your sms for delivery time."
    exit
  end

end
