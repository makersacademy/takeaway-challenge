
class Order
  attr_reader :basket

  def initialize
    @basket = []
  end

  def add_dish(dish, price)
    basket << { dish => price }
  end
end
