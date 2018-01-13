#ßunderstands how to display a menu
require_relative 'dish'

class Menu
  attr_reader :dish, :dishes

  def initialize
    @dishes = []
  end

  def add_dish(dish)
    @dish = dish
    @dishes << dish
  end

  def display
    @dishes
  end

end
