# understands how to create and close orders and keeps a history of them

require_relative 'order'

class Dispatcher

  attr_reader :current_order, :new_order, :order_history

  def initialize(order = Order.new)
    @new_order = order
    @current_order = nil
    @order_history = []
  end

  def create_new_order(list, sum)
    @current_order = new_order
    current_order.start_order(list, sum)
  end

  def close_order
    order_history << current_order
    @current_order = nil
  end

end
