# a Takeaway in your neighbourhood
class Takeaway
  attr_reader :order

  def menu
    'noodles'
  end

  def new_order(order = Order.new)
    @order = order
  end

  def place_order
    # send sms?
    @order.place
  end
end
