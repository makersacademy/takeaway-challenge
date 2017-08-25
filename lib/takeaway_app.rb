require_relative './order.rb'
require_relative './messager.rb'
require 'twilio-ruby'

class TakeawayApp

  attr_reader :order, :user_input_array

  def initialize(order_class = Order)
    @order_class = order_class
  end

  def show_dishes
    @menu = Menu.new
    @menu.show_dishes
  end

  def prompt_order
    print "Please enter the dish number followed by a space followed by the quantity you would like to order."
    puts " When you are finished please press enter twice."
  end


  def get_user_input
    @user_input_array = []
    loop do
      user_input = STDIN.gets.delete("\n")
      break if user_input == ""
      @user_input_array << user_input
    end
    @order = @order_class.new(@user_input_array)
  end

  def show_order
    @order.show
  end

  def check_calculation
    puts "What do you think your total should be?"
    check_cost = STDIN.gets.delete("\n")
    raise "Does not add up correctly" if @order.total != check_cost.to_i
  end

  def send_message
    @messager = Messager.new
    @messager.create_message
    @messager.send_message
  end

  def run
    show_dishes
    prompt_order
    get_user_input
    show_order
    check_calculation
    send_message
  end

end

# t = TakeawayApp.new
# t.run
