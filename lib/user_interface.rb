require_relative 'menu.rb'
require_relative 'order.rb'
require 'twilio-ruby' # put your own credentials here
require_relative 'SMS.rb'

class UserInterface
  def initialize
    @menu = Menu.new
    @order = Order.new(menu) #maybe move to order start?
    interactive_menu
  end

  def initialize_message
    puts "Welcome to James' takeaway service."
    puts "Please select from the following options to begin ordering"
  end

  def interactive_menu
    initialize_message
    loop do
      print_options
      selection = gets.chomp
      user_selection(selection)
    end
  end

  def print_options
    puts "1. See the menu"
    puts "2. Start your order"
    puts "9. Quit"
  end

  def user_selection(selection)
    case selection
      when "1"
        print_menu
      when "2"
        start_order
        enter_details
        order_confirmation
      when "9"
        exit
      else
        puts "I don't know what you meant, try again."
    end
  end

  def print_menu
    menu.dishes.each do |dish, price|
      puts "#{dish}..... #{price}"
    end
  end

#----------------------- ORDER STUFF ----------------------------------------

  def start_order
    puts "Enter in the dish you want to order."
    loop do
      dish_selection = gets.chomp
      break if dish_selection == 'q'
      while menu.has_dish?(dish_selection) == false do
        puts "Sorry, we don't have #{dish_selection}."
        puts "As a reminder, the dishes we have are:"
        print_menu
        dish_selection = gets.chomp
      end
      puts "How many of the #{dish_selection} would you like?"
      dish_quantity = gets.chomp.to_i
      order.add_to_order(dish_selection, dish_quantity)
      puts "Your order currenlty is: #{order.order}"
      puts "Enter another dish or type 'q' to finish selecting your food."
    end
  end

  def enter_details
    puts "Your order is:"
    puts order.order

    puts"In order to get the food to you, we'll need some details"
    puts "please enter in your name:"
    @customer_name = gets.chomp
    puts "Thanks #{@customer_name}. Now we'll need your address:"
    @customer_address = gets.chomp
    puts "And finally, we'll need your mobile phone number:"
    @customer_number = gets.chomp
  end

  def order_confirmation
    puts "------------------------"
    puts "Thank you #{@customer_name} for your order."
    puts "Below is your order confirmation."
    puts "Address: #{@customer_address}"
    puts "Phone Number: #{@customer_number}"
    puts @order

    send_confirmation_sms(@customer_number)
  end

  def send_confirmation_sms(number)
    order_arrival_time = Time.now + 60*60 #60 seconds * 60 mins == 1 hour
    confirmation_message = SMS.new
    confirmation_message.order_confirmation_sms(@customer_number, order_arrival_time)
  end

private
attr_reader :menu, :order

end
