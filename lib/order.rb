require_relative './menu.rb'

class Order

  attr_reader :entries, :menu

  def initialize(menu)
    @entries = []
    @menu = menu
  end

  def add_entry(dish_name, quantity = 1)
    dish = @menu.get(dish_name)
    if dish
      (@entries << dish) * quantity
    else
      "Dish not found"
    end
  end
end
