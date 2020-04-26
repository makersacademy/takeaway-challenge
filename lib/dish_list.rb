require './lib/dish'

class DishList
  attr_reader :dishes

  def initialize
    @dishes = Array.new
    create_dishes
  end

  private
  def create_dishes
    @dishes << Dish.new("Burger", 3)
    @dishes << Dish.new("Pizza", 5)
    @dishes << Dish.new("Kebab", 4)
  end
end
