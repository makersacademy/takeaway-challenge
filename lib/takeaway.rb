require 'twilio-ruby'
require_relative 'message'
require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :order, :message

  def new_order
    @order = Order.new
  end

  def place_order
    fail "The total order price is different from the dishes on the order" if correct_total? == false
    @order.order_summary
    @message = Message.new
    @message.send_message
  end

  private

  def correct_total?
    @order.selection.map{|item| item[:price]}.inject(:+).round(2) == @order.order_price
  end

end
