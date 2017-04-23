require_relative 'order_selection'
require_relative 'menu_printer'

class Terminal

  attr_accessor :menu, :order

  def initialize(order = OrderSelection.new, checkout = CheckOut.new)
    @order = order
    @checkout = checkout
  end

  def view_menu
  end

  def add_to_order(item, quantity)
    @order.add_item(item, quantity)
  end

  def delete_from_order(item, quantity)
    @order.remove_item(item, quantity)
  end

  def outstanding_balance(v = @order.cart)
    @checkout.balance(v = @order.cart)
  end

end
