require_relative "dish"
require_relative "menu"

class Order
  def initialize(menu)
    @menu = menu
    @customer_selection = []
  end

  def add(dish_name, quantity)
    dish = @menu.get_dish(dish_name)
    store_to_order(dish, quantity)
  end

  def total
    total = 0
    @customer_selection.each { |dish|
      total += dish.price
    }
    return total
  end

  def place_order
  end

  private

  def store_to_order(dish, quantity)
    quantity.times { @customer_selection << dish }
  end
end
