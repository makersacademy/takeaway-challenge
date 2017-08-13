require 'menu'

class Restaurant

  attr_reader :name, :menu
  def initialize(name, menu)
    @name = name
    @menu = menu
  end

  def add_to_menu(item, price)
    @menu.add_dish(item, price)
  end

  def remove_from_menu(item)
    @menu.remove_dish(item)
  end

  def display_menu
    @menu.display_list
  end

end
