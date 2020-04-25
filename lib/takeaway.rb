class Takeaway
  attr_reader :menu, :order, :basket

  def initialize(order = Order.new)
    @menu = [{ :chips => 1.80 }, { :burger => 10.00 }]
    @order = order
    @basket = {}
  end

  def display
    @menu
  end

  def select(**dish_and_quantity)
   @basket = dish_and_quantity
  end

  def place_order(order_total)
    @order.order(order_total, @menu, @basket)
  end

  def verify_order(order_total)
    @order.verify(order_total)
  end
end
