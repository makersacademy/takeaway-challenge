require 'order'
require 'menu'

class Takeaway
  def initialize(order = Order.new, menu = Menu.new)
    @order = order
    @menu = menu
  end

  def read_menu
    @menu.display_menu
  end

  def add_to_basket(item, quantity)
    @order.add(item, quantity)
  end

  def remove_from_basket(item)
    @order.remove(item)
  end

  def total_price
    @order.total
  end

end