
require_relative 'dish'

class Menu
  attr_reader :list
  attr_accessor :dishes

  def initialize()
    @dishes = []
  end

  def read_menu
    @dishes
  end

  def add(dish)
    (@dishes.include?(dish))? @dishes : @dishes << dish
  end

end
