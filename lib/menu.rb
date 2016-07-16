require_relative 'dish'

class Menu
  attr_reader :menu_items

  def initialize
    @menu_items = {}
  end

  def add_dish(dish)
    @menu_items[dish.name] = dish.price
  end

end
