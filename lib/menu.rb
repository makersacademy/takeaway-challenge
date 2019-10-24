require 'dish'

class Menu

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish(dish = Dish.new("Swedish Meatballs", 2.50))
    @dishes << dish
  end
end
