require './lib/food_item.rb'

class Menu
  attr_reader :menu

  def initialize
    @menu = []
  end

  def add(food_item)
    @menu << food_item
  end

  def remove(food_item)
    @menu.delete(food_item)
    @menu
  end
end
