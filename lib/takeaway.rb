require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :menu, :order, :order_klass, :menu_name

  def initialize(menu_klass: Menu, order_klass: Order, menu_name: :italian)
    @menu = menu_klass.new(menu_name: menu_name)
    @order_klass = order_klass
    @order = order_klass.new(menu_instance: menu)
  end

  def show_menu
    menu.show
  end

  def place_order(item, qty = 1)
    @order ||= order_klass.new(menu_instance: menu)
    return 'Please order 1 or more items' if qty < 1
    return 'This item is not on the menu' unless available? item
    order.add(item, qty)
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

  private
  def available? item
    menu.listed? item
  end
end
