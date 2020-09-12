require_relative 'order'

class Menu

  attr_reader :meals, :order

  def initialize(order = Order.new)
    @meals = { "pizza" => 6, "noodles" => 4, "ice cream" => 3 }
    @order = order
  end

  def view
    @meals
  end

  def select(dish)
    @order.add(dish) if @meals.include?(dish)
  end

end