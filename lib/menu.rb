require "./lib/dish.rb"
class Menu

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish(dish = Dish.new)
    @dishes << dish
  end

  def print
    @dishes
  end
end
