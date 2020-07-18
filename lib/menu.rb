require_relative 'dish'
require_relative 'order'

class Menu
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add(dish)
    @dishes << dish
  end
end
