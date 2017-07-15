class Order
  attr_reader :dishes

  def initialize
    @dishes = {}
  end

  def add_dish(dish, quantity)
    @dishes[dish] = quantity
  end

end
