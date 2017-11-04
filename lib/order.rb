require_relative 'dishes'

class Order

  attr_reader :ordered_list

  def initialize
    @menu = Dishes.new
    @ordered_list = []
  end

  def asks_menu
    @menu.print_menu
  end

  def asks_for_dish(dish)
    @menu.selecting_dish(dish)
  end

  def place_order(ordered_dish)
    @ordered_list << asks_for_dish(ordered_dish)
  end
end
