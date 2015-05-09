require_relative 'twilio'
class Takeaway

  attr_reader :menu, :orders, :message_sender, :total_order_value

  def initialize(message_sender = TwilioSender.new)
    @menu = {:FishAndChips => 5, :MeatAndTwoVeg => 7}
    @orders = []
    @message_sender = message_sender
    @total_order_value = 0
  end

  def list_menu
    p menu
  end

  def add_order_item item, quantity = 1
    quantity.times do
      orders << menu.select{|k,v| k == item}
    end
  end

  def give_order_total
    @total_order_value = orders.map{|x| x.values}.flatten(1).inject(:+)
    return total_order_value
  end

  def remove_order
    orders.pop
  end

  def respond_to_order
    @message_sender.send_message
  end
end