require 'dish'

class Menu

  attr_reader :items

  def initialize
    @items = [Dish.new(:Burger, 9)],[Dish.new(:Curry, 8)],[Dish.new(:Soup, 6)]
  end
end
