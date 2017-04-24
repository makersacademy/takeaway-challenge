require_relative 'menu'
require_relative 'order'
require_relative 'checkout'

class Restaurant

  attr_reader :menu, :order_class, :current_order, :checkout

  def initialize(menu: Menu.new, order_class: Order, checkout: Checkout.new)
    @order_class = order_class
    @current_order = order_class.new
    @menu = menu
    @checkout = checkout
  end

  def read_menu
    menu.dishes
  end

  def order(item, quantity)
    current_order.order_item(item, quantity)
  end

  def sumarise_order
    @checkout.sumarise(this_order, menu_summary)
  end

  def order_total
    total = @checkout.total_price(this_order, menu_summary)
    "£#{total}"
  end

  def this_order
    @current_order.items
  end

  def menu_summary
    @menu.dishes
  end
end
