require 'dish'

class Menu

  attr_reader :dishes

  def initialize
    @dishes = [
      Dish.new("Swedish Meatballs", 2.50),
      Dish.new("Pizza", 3),
      Dish.new("Jerk Chicken", 2.99)
      ]
  end

  def add_dish(dish = Dish.new)
    @dishes << dish
  end
end
