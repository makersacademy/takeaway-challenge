require_relative 'dish'

class Menu
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add(dish = Dish.new)
    @dishes << { dish.name => dish.price }
  end

end
