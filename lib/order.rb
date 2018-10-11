
class Order
  attr_reader :basket

  def initialize
    @basket = []
  end

  def add_dish(dish)
    basket << dish
  end
end
