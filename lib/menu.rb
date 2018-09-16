require_relative 'dish'

class Menu
  attr_accessor :dishes

  def initialize
    @dishes = []
  end

  def add_dish(dish) # dish is instance of dish class
    # raise "add_dish expects an instance of Dish class" unless dish.is_a?(Dish)
    @dishes.push(dish)
  end

  def display
    @dishes
  end

  def has_dish?(dish_name)
    @dishes.each do |dish|
      return true if dish.name == dish_name
    end
    return false
  end

end