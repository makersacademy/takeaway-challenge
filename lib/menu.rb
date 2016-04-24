require_relative 'dish'

class Menu

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish(new_dish = Dish.new(name,price))
    dishes << new_dish
  end

  def print_menu
    dishes.each {|dish| puts dish.print_dish}
  end

end