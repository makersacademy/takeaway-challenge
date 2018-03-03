# Order class definition
# this class is responsible for collecting and processing orders
class Order
  attr_reader :order
  def initialize
    @order = [] # save a hash like {dish: quantity}
  end

  def add_to_order(dish, quantity)
    @order << [dish, quantity]
  end

  def calculate_total
    total = 0
    @order.each{ |dish| total += dish.first.price * dish.last }
    total
  end

end
