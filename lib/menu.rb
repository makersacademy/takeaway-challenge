require './lib/dish'

class Menu

  attr_reader :dishes

  def initialize
    @dishes = [
      Dish.new("Chips", 2),
      Dish.new("Onion rings", 1),
      Dish.new("Cheese burger", 10),
      Dish.new("Chicken burger", 9),
      Dish.new("Pizza", 8),
      Dish.new("Chicken kebab", 9),
      Dish.new("Mixed kebab", 12)
    ]
  end

end
