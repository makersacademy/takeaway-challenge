require_relative 'dish'
class Menu
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add(dish)
    @dishes << dish
    dish
  end

  def remove(dish)
    @dishes << dish
    dish
  end

  def menu
    @dishes
  end
end

