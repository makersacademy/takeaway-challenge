require 'twilio-ruby'
require_relative 'message'
require_relative 'menu'
require_relative 'order'

class Checkout

  attr_reader :start_order

  def start_order
    @order = Order.new
  end


  def completed_order(message = Message.new)
    message.send_message
    "Your order will be delivered before #{Time.now + 1}."
  end

end
