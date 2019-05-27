# Allows takeaway to checkout current order and send confirmation text message using Twilio API
require_relative 'send_sms' #twilio-ruby code hidden in .gitignore 

class Takeaway

  def initialize(order = Order.new)
    @order = order
    @message = Message.new
  end
  
  def checkout
    text
    @order.display_total
  end

  def text
    @message.send
  end
end