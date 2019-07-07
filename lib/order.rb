require 'menu'
require 'order'
require 'pry'

class Order
  def initialize(dishes = [], menu)
    @dishes = dishes
    @menu = menu
  end

  def total
    (@dishes.map { |dish, quantity| @menu.cost(dish) * quantity }).sum
  end

  def quantity(dish)
    1
  end

  def add(dish_name, number = 1)
    @dishes.push({ dish_name.to_sym => number })
  end

  def list_dishes
    @dishes
  end

end

binding.pry
