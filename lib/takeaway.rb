require_relative 'menu'
require_relative 'order'
require_relative 'checkout'

class Takeaway

  attr_reader :menu, :order_klass, :current_order, :checkout

  def initialize(menu: Menu.new, order_klass: Order, checkout: Checkout.new)
    @menu = menu
    @order_klass = order_klass
    @current_order = order_klass.new
    @checkout = checkout
  end

  def read_menu
    menu.dishes
  end

  def order(item, quantity = 1)
    fail "You cannot buy #{item} here" if not_on_menu?(item)
    current_order.order_item(item, quantity)
  end

  def basket_summary
    checkout.sum_each(working_order, menu_summary)
  end

  def basket_total
    total = checkout.sum_total(working_order, menu_summary)
    "£#{total}"
  end

  def basket_checkout(payment)
    checkout.finalise_payment(payment, working_order, menu_summary)
  end

  private

  def working_order
    current_order.list
  end

  def menu_summary
    menu.dishes
  end

  def not_on_menu?(item)
    !menu.includes?(item)
  end

end
