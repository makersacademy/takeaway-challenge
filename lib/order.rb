class Order 
  attr_reader :dishes
  def initialize 
    @dishes = {}
  end

  def add(dish, quantity)
    dishes.store(dish, quantity)
  end
end
