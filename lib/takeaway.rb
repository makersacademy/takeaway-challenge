require_relative 'twilio'
class Takeaway

  attr_accessor :menu, :orders, :message_sender

  def initialize(message_sender = TwilioSender.new)
    @menu = {:Fish => 5, :Meat => 7}
    @orders = [] #could be an object >> see how emerges
    @message_sender = message_sender
  end

  def list_menu
    p menu
  end

  def add_order_item item, quantity = 1
    quantity.times do
      orders << menu.select{|k,v| k == item}
    end
  end

  def respond_to_order
    @message_sender.send_message
  end
end