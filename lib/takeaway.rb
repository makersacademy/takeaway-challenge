require_relative 'menu'
require_relative 'order'

class Takeaway
  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def read_menu
    @menu.display
  end

  def order(dish, quantity = 1)
    @order.take(dish, quantity)
  end

  def basket_summary
    @order.display
  end

  def calculate_total

  end

  def checkout

  end

end
