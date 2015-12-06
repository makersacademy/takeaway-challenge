require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :menu, :order

  def initialize
    @menu = Menu.new
    @order = Order.new
  end

  def show_menu
    menu.show
  end

  def place_order(item, quantity = 1)
    return 'This item is not available' unless available?(item)
    order.add(item, quantity)
  end

  def show_order
    order.overview
  end

  def checkout_order(price = 0)
    order.checkout(price)
  end

  def reset_order
    order.reset
  end

  def available?(item)
    menu.listed?(item)
  end

  private

end
