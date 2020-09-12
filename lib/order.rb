require_relative "dish"
require_relative "menu"

class Order
  def initialize(menu)
    @menu = menu
    @customer_selection = []
  end

  def add(dish_name, quantity)
    raise "Dish is not on the menu" if dish_not_on_menu?(dish_name)
  end

  private

  def dish_not_on_menu?(dish_name)
    @menu.each { |menu_dish|
      if dish_name == menu_dish.name
        return false
      end
    }
  end
end
