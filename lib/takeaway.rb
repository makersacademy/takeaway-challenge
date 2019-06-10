require './lib/message.rb'
require './lib/order.rb'

class Takeaway
  attr_reader :order
  LIST = {
    :olives => 4.00,
    :cheese_board => 10.00,
    :pizza => 8.00,
    :carbonara => 10.00,
    :chicken =>  12.00,
    :salad => 8.00,
    :burrata => 6.00,
    :steak => 15.00,
    :brownie => 5.00
  }

  def initialize(message_class = Message, order_class = Order)
    @message = message_class
    @order = order_class
  end

  def menu
    LIST
  end

  def select
    @order = @order.new
    @order.start_order
  end

  def check_total
    puts "Enter the total"
    user = gets.chomp.to_i
    raise 'The total is not correct' if user != @order.total

    "The total match the sum of #{user}£"
  end

  def place_order
    @message.new.send
  end

end
