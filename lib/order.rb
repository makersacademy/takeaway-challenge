class Order

  attr_reader :foods

  def initialize
    @foods = []
  end

  def add_food(food)
    @foods << food
  end
end