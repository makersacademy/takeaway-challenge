require_relative 'dish'

class Menu

  attr_reader :menu, :dishes

  def initialize
    @dishes = {}
  end

  def add(dish)
    @dishes[dish.name] = dish.price
  end

end
