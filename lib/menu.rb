require_relative 'dish'

class Menu

  attr_reader :dishes

  def initialize
    @dishes = [ Dish.new("dumplings", 5),
                Dish.new("tomato soup", 6),
                Dish.new("apple pie", 2) ]
  end

  def order(selection)
    order = dishes.select { |dish| dish.name == selection }.first
    message = "Item not on the menu. Would you like to select a different dish?"
    fail message if order.nil?
    order
  end
end
