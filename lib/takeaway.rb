require_relative 'order'
require_relative 'menu'

class Takeaway

  def initialize
    @order = Order.new
  end

  def print_menu
    @order.menu.print_menu
  end

  def place_an_order(dish, qnty = 1)
    @order.place_an_order(dish, qnty)
  end

  def display_basket
    @order.basket.display_basket
  end

  def total
    @order.total
  end

  def complete(price)
    @order.complete(price)
  end

end
