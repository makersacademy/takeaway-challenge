require_relative 'menu'

class Order

attr_reader :food_order
  def initialize
    @food_order = []
  end

  def order_food(food, quantity)
    @food_order << {:food => food, :quantity => quantity}
  end
    



end
