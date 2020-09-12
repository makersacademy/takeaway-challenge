require_relative 'menu'

class Restaurant
  attr_reader :menu

  def initialize(menu)
    @menu = menu
  end

  def format_menu
    @menu.format
  end

  def find_dish(dish_name)
    @menu.find_dish(dish_name)
  end
end
