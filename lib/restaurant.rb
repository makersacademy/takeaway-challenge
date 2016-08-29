# understands how to receive, place and confirm orders

require_relative 'dishes'
require_relative 'order'
require_relative 'dispatcher'
require_relative 'message'

class Restaurant

  attr_reader :dishes, :dispatcher, :list, :sum, :message, :phone_number

  def initialize(dishes = Dishes.new, dispatcher = Dispatcher.new, message = Message.new)
    @dishes = dishes
    @dispatcher = dispatcher
    @message = message
    @list = []
    @sum = 0
    @phone_number = ""
  end

  def take_order
    system "clear"
    greet_customer
    what_would_you_like
    order_more
    how_much
    get_phone_number
    puts
    puts "Okay, let me place your order and confirm it"
    place_order
    confirm_order
    puts "I've sent you a text to confirm you order!"
    puts "Thank you from the Chicken Shop!"
  end

  private

  def greet_customer
    # system "clear"
    puts
    puts "Hello this is the Chicken Shop!"
    puts "I'm ready to take your order."
    puts
    puts "Tonight we have the following dishes:"
    puts
    available_dishes.each_value { |dish|
      puts "#{dish[:name]}, $#{dish[:price]}"
    }
    puts
  end

  def what_would_you_like
    puts "What would you like to order?"
    dish = gets.chomp.downcase.to_sym
    if available_dishes.has_key?(dish)
      puts "How many would you like?"
      quantity = gets.chomp.to_i
    else
      puts "Sorry we don't have that dish!"
    end
    list << [dish, quantity]
  end

  def order_more
    puts
    puts "Would you like anything else? (Yes or No)"
    answer = gets.chomp.downcase
    if answer == "yes"
      what_would_you_like
      order_more
    end
  end

  def how_much
    puts "Please input the total so I can confirm your order"
    sum = gets.chomp.to_i
    @sum = sum
  end

  def get_phone_number
    puts "And finally, please give me your number (e.g. +44..) so that I can keep you updated"
    number = gets.chomp
    message.set_phone_number(number)
  end

  def place_order
    dispatcher.create_new_order(list,sum)
  end

  def confirm_order
    raise "Wrong total!" if dishes.check_sum(list, sum) == false
    dispatcher.current_order.confirm_order
    message.send_confirmation
  end

  def available_dishes
    dishes.dishes
  end

end
