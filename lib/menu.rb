require_relative 'dishes_list'

class Menu
  attr_reader :menu

  def initialize
    @menu = {}
  end

  def add(dish)
    @menu[dish.name] = dish.price
  end

  def print_menu
    @menu
  end

end
