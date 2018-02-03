require_relative "dish"

class Order

  attr_reader :current_order, :dish

  def initialize(dish = Dish)
    @current_order = []
    @dish = dish
  end

  def select_dish(dish_number)
    selected_dish = dish.new(dish_number)
    @current_order << selected_dish
    selected_dish
  end

end
