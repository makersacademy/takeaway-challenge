require_relative 'order'
require_relative 'menu'

class TakeAway

  def initialize(order = Order.new, menu = Menu.new)
    @order = order
    @menu = menu
  end

  def show_menu
    @menu.print_menu
  end

  def order_dish(dish, qty)
    @order.add_dish(dish, qty)
  end

  def receipt
    @order.print_order(@menu)
  end
end
