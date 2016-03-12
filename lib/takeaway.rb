require_relative "menu"
require_relative "order"

class TakeAway

  def initialize(menu, order_class: Order)
    @menu = menu
    @order_class = order_class
    @order = order_class.new(@menu)
  end

  def read_menu
    @menu.display
  end

  def order(item, quantity = 1)
    @order.add(item, quantity)
  end

  def total
    "Total: £#{@order.sum}"
  end
end
