require_relative 'menu'
require_relative 'order'
require_relative 'calculate'

class Takeaway
  attr_reader :basket

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

  def total
    Calculate.add(@order.basket_with_prices)
  end

  def checkout

  end

end
