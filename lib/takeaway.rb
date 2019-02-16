# a Takeaway in your neighbourhood
class Takeaway
  attr_reader :order

  def menu
    [
      Dish.new('rice', 3),
      Dish.new('noodles', 3.5),
      Dish.new('spring rolls', 2.5)
    ]
  end

  def new_order(order = Order.new)
    @order = order
  end

  def place_order
    # send sms?
    @order.place
    @order = nil
  end

end
