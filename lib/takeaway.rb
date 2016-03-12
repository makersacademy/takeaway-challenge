require_relative "menu"
require_relative "order"

class TakeAway

  def initialize(menu, order_class)
    @menu = menu
    @order_class = order_class
    @order = nil
  end

  def read_menu
    @menu.display
  end

  def order(item, quantity = 1)
    @order = @order_class.new
    @order.add(item, quantity)
  end

end
