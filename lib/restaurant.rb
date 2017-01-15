require_relative 'order'

class Restaurant

  attr_reader :order

  def initialize(order = Order.new)
    @order = order
  end

  def confirm_order
    @order.order_complete == true ? 1 : 2
  end


end
