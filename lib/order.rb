class Order
  attr_reader :basket

  def initialize
    @basket = {}
  end

  def add_dish(dish, quantity)
    @basket.store(dish, quantity)
  end

end
