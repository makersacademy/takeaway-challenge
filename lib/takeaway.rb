# your favourite Takeaway
require './lib/dish'

class Takeaway
  attr_reader :menu
  
  def initialize
    @menu = [
      Dish.new(1, 'plain rice'),
      Dish.new(2, 'sticky rice'),
      Dish.new(2.5, 'coconut rice'),
      Dish.new(4, 'chow mein'),
      Dish.new(3, 'spring rolls (3)')
    ]
  end

  def start_order(order = Order.new)
    @order = order
  end
end
