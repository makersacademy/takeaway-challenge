require_relative 'order'

class Takeaway
  attr_reader :order_class
  def initialize order_class = Order
    @order_class = Order
  end
end
