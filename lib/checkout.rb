require 'order'

class Checkout

  def initialize

  end

  def total_cost(order)
    get_prices(order.current_order)
  end

  private
  def get_prices(current_order)
    order.current_order.map { |dish| Menu::LIST_OF_DISHES[dish] }
  end
end
