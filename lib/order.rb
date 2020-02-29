require_relative 'menu'

class Order

  attr_reader :current_order, :pay_amount

  def initialize
    @current_order = []
    @pay_amount = 0
  end

  def add_dish(dish)
    fail "Sorry, that dish is not available" if existent_dish?(dish) == false

    @current_order << dish
  end

  def existent_dish?(dish)
    $menu_list.has_key?(dish) ? true : false
  end

end
