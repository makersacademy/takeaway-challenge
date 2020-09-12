require_relative 'order'

class Menu
  
  MEALS = { "pizza" => 6, "noodles" => 4, "ice cream" => 3 }
  attr_reader :meals, :order

  def initialize(order = Order.new)
    @order = order
  end

  def view
    MEALS
  end

  def select(dish)
    @order.add(dish) if MEALS.include?(dish)
  end

end