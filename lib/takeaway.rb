require_relative 'order'
require_relative 'verify'
require_relative 'confirmation'

class Takeaway

attr_reader :order_class, :order

  def initialize(order_class = Order)
    @order_class = order_class
  end

  def start_order
    @order = order_class.new
  end

  def complete_order
    order.checkout
    #verify = Confirmation.new(price)
  end

end
