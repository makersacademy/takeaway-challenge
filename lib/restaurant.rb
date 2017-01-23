require_relative 'order'
require_relative 'messenger'

class Restaurant

  attr_reader :order

  def initialize(order = Order.new, message = Messenger.new)
    @order = order
    @message = message
  end

  def confirm_order
    message = """
    Thank you for placing an order!\nThe total is £#{@order.total_cost}.\nIt will be arriving at #{(Time.new + 3600).hour}:#{(Time.new).min}.
    """
    @message.send(message) if @order.order_complete == true
  end


end
