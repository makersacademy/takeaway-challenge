require_relative "dish"
require_relative "menu"

class Order
  def initialize(menu)
    @menu = menu
    @customer_selection = []
  end

  def add(dish, quantity)
  end
end
