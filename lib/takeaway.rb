# a Takeaway in your neighbourhood
class Takeaway
  attr_reader :order, :menu, :dishes

  def initialize
    @dishes = { rice: 3, noodles: 3.5, prawn_crackers: 1, spring_rolls: 2.5 }
  end

  def new_order(order = Order.new)
    @order = order
  end

  def place_order
    # send sms?
    @order.place
    exit
  end

end
