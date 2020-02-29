require_relative 'menu'

class Order

  attr_reader :current_order, :prices_to_sum

  def initialize
    @current_order = []
    @prices_to_sum = []
  end

  def add_dish(dish)
    fail "Sorry, that dish is not available" if existent_dish?(dish) == false

    @current_order << dish
    @prices_to_sum << $menu_list[dish]
  end

  def existent_dish?(dish)
    $menu_list.has_key?(dish) ? true : false
  end

end
