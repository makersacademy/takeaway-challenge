require 'menu'
require 'order'

class Takeaway

  attr_reader :order

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def print_menu
    @menu.list_menu
  end

  def add_to_order(item, quantity = 1)
    raise "Item not on menu!" if available(item) == false
    @order.add_to_basket(@menu.items.select { |k| k == item.downcase.capitalize }, quantity)
    @order.add_to_total(@menu.items[item], quantity)
  end

  def order_summary
    @order.order_summary
  end

  def basket
    @order.basket
  end

  def total
    @order.total
  end

  def available(item)
    @menu.items.has_key?(item.downcase.capitalize)
  end

end
