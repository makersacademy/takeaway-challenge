require 'dish'

class Menu

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish(dish = Dish.new)
    @dishes << dish
  end
end
