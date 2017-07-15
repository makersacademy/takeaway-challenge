# this class returns readable list of dishes and allows for placing an order
require_relative 'dish'

class Menu

  attr_reader :list_of_dishes

  def initialize
    @list_of_dishes = []
  end

  def add_dish(name, price, dish_class = Dish)
    @list_of_dishes << dish_class.new(name, price)
  end

  def show_menu
    list_of_dishes.each_with_index.map { |dish, index| "#{index + 1}. #{dish.menu_readable}" }.join("\n")
  end

end
