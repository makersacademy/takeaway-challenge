class Order

  attr_reader :foods

  def initialize
    @foods = []
  end

  def add_food(food, quantity = 1)
    quantity.times {
      @foods << food
    }
    @foods
  end
end
