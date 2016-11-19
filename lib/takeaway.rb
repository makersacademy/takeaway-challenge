require_relative 'menu'
require_relative 'order'


class Takeaway

  attr_reader :menu, :order_klass
  attr_accessor :order

  def initialize(menu_klass, order_klass)
    @menu = menu_klass.new
    @order_klass = order_klass
  end

  def view_menu
    menu.print
  end

  def begin_order
    @order = order_klass.new(menu)
  end

  def add(item,quantity=1)
    order.add(item,quantity)
  end

end
