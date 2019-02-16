# a Takeaway in your neighbourhood
class Takeaway
  attr_reader :order, :menu

  def initialize
    @menu = [
      Dish.new('rice', 3),
      Dish.new('noodles', 3.5),
      Dish.new('spring rolls [3]', 2.5),
      Dish.new('prawn crackers', 1)
    ]
  end

  def new_order(order = Order.new)
    @order = order
  end

  def place_order
    # send sms?
    @order.place
  end

end
