require_relative 'menu'
require_relative 'order'

class Takeaway

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def check_menu
    print @menu.list
  end

  def add_to_order(item, quantity)
    @order.add(item, quantity)
  end

  def summary
    # returns order so far
  end

  def total
    # completes order returns total
  end
end
