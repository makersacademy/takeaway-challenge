require_relative 'dish'
class Menu
  attr_reader :dishes

  def initialize
    @dishes = {}
  end

  def add(dish)
    @dishes[dish.name] = dish.price
    return dish
  end

  def remove(dish)
    @dishes.delete(dish.name)
    return dish
  end

  def show_dishes
  end

  def available?(dish)
    return @dishes.include?(dish)
  end

  def menu
    @dishes
  end
end
