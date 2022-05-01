require_relative 'dishes'

class Order
  attr_reader :basket, :menu, :dish_available

  def initialize
    @basket = Array.new(0)
    dishes = Dishes.new
    @menu = dishes.menu
    @dish_available = dishes.dish_available?
  end

  def select_dishes(index)
    raise "Dish is not available. Please choose a different dish."if !dish_available
    @basket << @menu[index - 1]
  end

end
