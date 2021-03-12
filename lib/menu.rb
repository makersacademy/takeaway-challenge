require 'dish'

class Menu

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_to_menu(name, price)
    @dishes << Dish.new(name, price)
  end

end
