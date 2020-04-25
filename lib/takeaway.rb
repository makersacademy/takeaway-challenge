class Takeaway
  attr_reader :menu, :order

  def initialize(order = Order.new)
    @menu = [{ :chips => 1.80 }, { :burger => 10.00 }]
    @order = order
  end

  def display
    @menu
  end

  def place_order(order_total, **dish_and_quantity)
    @order.order(order_total, @menu, **dish_and_quantity)
  end

  def verify_order(order_total)
    @order.verify(order_total)
  end
end
