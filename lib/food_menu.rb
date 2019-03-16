class FoodMenu

  attr_reader :food

  def initialize(food)
    @food = food
  end

  def print
    food.map{ |dish, price| 
      "#{dish}: #{price}"}.sort
    .join(", ")
  end

end