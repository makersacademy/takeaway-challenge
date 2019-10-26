require_relative 'dish'
class Menu
  attr_reader :dishes

  def initialize
    @dishes = {}
  end

  def add(dish)
    @dishes[dish.name] = dish.price
    dish
  end

  def remove(dish)
    @dishes.delete(dish.name)
    dish
  end

  def show_dishes
  end

  def available?(dish)
    return @dishes.include?(dish.name)
  end

  def menu
    @dishes
  end
end

