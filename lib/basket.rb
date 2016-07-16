

class Basket

  attr_reader :basket

  def initialize
    @basket = Hash.new(0)
  end

  def add(dish, quantity)
    @basket[dish] += quantity
  end
end
