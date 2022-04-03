require_relative './dish'
# Creates a list of dishes.

class Menu
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def list_dishes
    @dishes
  end
end
