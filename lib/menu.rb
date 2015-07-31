require_relative './dish.rb'

class Menu

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish dish
    dishes << dish
  end
end