require 'twilio-ruby'
require_relative 'message'
require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :order, :message

  def new_order
    @order = Order.new
  end

  def place_order(message = Message.new)
    fail "The total order price is different from the dishes on the order" if @order.correct_total? == false
    @order.order_summary
    message.send_message
  end

end
