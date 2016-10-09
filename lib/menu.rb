require_relative 'dish'

class Menu
  attr_reader :items

  def initialize
    @items = [Dish.new("pie", 5), Dish.new("pizza", 6)]
  end

  def order(selection)
    items.select { |item| item.name == selection }.first
  end
end
