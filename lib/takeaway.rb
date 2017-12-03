require_relative 'order'
require_relative 'menu'
require_relative 'message_sender'

class Takeaway
  attr_reader :order_class, :msg_sender, :menu, :order, :order_history
  def initialize(order_class = Order, msg_sender = MessageSender.new, menu = Menu.new)
    @order_class = Order
    @msg_sender = msg_sender
    @menu = menu
    @order = order_class.new
    @order_history = []
  end

  def add(item, quantity)
    order.add_to_order(item, quantity)
  end

  def verify_total(total)
    order.total_cost == total ? "Correct" : "Incorrect, total is: #{order.total_cost}"
  end

  def checkout(phone_num)
    msg = "Your total is #{order.total_cost}."
    msg_sender.send_sms(msg, phone_num)
    archive_order
    create_new_order
  end

  private
  def archive_order
    order_history << order
  end

  def create_new_order
    @order = order_class.new
  end
end
