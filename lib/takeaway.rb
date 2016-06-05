require_relative 'order'
require_relative 'menu'
require_relative 'message'

class Takeaway

  def initialize(menu = Menu.new,order = Order.new)
    @menu = menu
    @order = order
  end

  def read_menu
    menu.list
  end

  def order_item(item)
    order.add_item(item)
  end

  def summary
    order.view_order
  end

  def total
    order.total
  end

  def checkout(total)
    order.checkout(total)
  end

    private
    attr_reader :menu, :order
end