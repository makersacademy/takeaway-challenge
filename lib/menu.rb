require_relative 'order'

class Menu
  
  MEALS = { "pizza" => 6.99, "noodles" => 4.99, "ice cream" => 3.99 }
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