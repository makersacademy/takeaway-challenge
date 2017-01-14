require_relative 'dish'

class Menu
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def print_menu
    @dishes
  end
end
