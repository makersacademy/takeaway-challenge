require_relative 'Order'

class OrderLog

  def initialize(order_class = Order)
    @order_class = order_class
    @orders = []
  end

  def add(user = nil, basket = nil)
    order = @order_class.new(user, basket.items)
    order.confirm_order
    basket.clear
    @orders << order
  end

  def orders
    @orders.dup
  end
end
