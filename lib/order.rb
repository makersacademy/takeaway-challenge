require_relative 'menu'
class Order
  attr_reader :dishes_ord
  def initialize
    @dishes_ord = []
  end
  def add(dish, quantity)
    dishes_ord << {dish: dish, quantity: quantity}
  end
end
