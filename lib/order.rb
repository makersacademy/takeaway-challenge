require_relative 'dishes'

class Order

  attr_reader :ordered_list, :total_price

  def initialize
    @menu = Dishes.new
    @ordered_list = []
    @total_price = 0
  end

  def asks_menu
    @menu.print_menu
  end

  def place_order(*ordered_dish)
    ordered_dish.each do |dish|
      @ordered_list << asks_for_dish(dish.to_s)
      add_price
    end
  end

  private

  def add_price
    @total_price += @ordered_list[-1].values.join().to_f
  end
  
  def asks_for_dish(dish)
    @menu.selecting_dish(dish)
  end

end
