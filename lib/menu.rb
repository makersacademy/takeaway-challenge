require_relative 'dish'

class Menu
  attr_reader :items

  def initialize
    @items = [Dish.new("pie", 5), Dish.new("pizza", 6)]
  end
end
