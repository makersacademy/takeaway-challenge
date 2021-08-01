class Menu

  attr_reader :food

  def initialize(food)
    @food = food
  end

  def list
    food.map do |dish, price|
     "%s £%.2f" % [dish.to_s.capitalize, price]
    end.join(", ")
  end
end
