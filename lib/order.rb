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

  def place_order(*ordered_dish)
    ordered_dish.each do |dish|
      @ordered_list << asks_for_dish(dish.to_s)
    end
  end

  private

  def asks_for_dish(dish)
    @menu.selecting_dish(dish)
  end

end
