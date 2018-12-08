require_relative 'dish'

class Menu
  attr_reader :dishes

  def initialize
    @dishes = Hash.new(0)
  end

  def add(dish)
    @dishes[dish.name] = dish.price
  end

end
