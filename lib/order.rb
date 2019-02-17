class Order

attr_reader :dishes  # acces the dishes

  def initialize
    @dishes = {}
  end

  def add(dish, quantity)
    dishes[dish] = quantity
  end
end
