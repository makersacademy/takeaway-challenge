# Allows takeaway to checkout current order and send confirmation text message using Twilio API
require_relative 'send_sms' #twilio-ruby code hidden in .gitignore 

class Takeaway

  def initialize(order = Order.new)
    @message = Message.new
    @order = order
  end
  
  def checkout
    text
    @order.display_total
  end

  def text
    @message.send
  end
end