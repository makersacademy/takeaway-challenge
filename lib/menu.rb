require 'order'

class Menu

  attr_reader :menu
  attr_reader :name

  def initialize(name)
    @menu = {}
    @name = name
  end

  def add_food(food, price)
    @menu[food] = price
  end

end