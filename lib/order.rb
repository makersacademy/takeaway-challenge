require 'CSV'

class Order

  attr_reader :basket, :total

  def initialize
    @basket = []
    @total = 0
  end

  def select(dish)
    basket << {dish: dish, quantity: 1}
    @total += 9
  end
end
