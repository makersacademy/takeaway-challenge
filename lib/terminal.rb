require_relative 'order_selection'
require_relative 'menu_printer'
require_relative 'checkout'
require_relative 'delivery'

class Terminal

  attr_accessor :menu, :order, :delivery, :checkout, :menu_printer

  def initialize(order = OrderSelection.new, checkout = CheckOut.new, delivery = Delivery.new, menu_printer = MenuPrinter.new)
    @order = order
    @checkout = checkout
    @delivery = delivery
    @menu_printer = menu_printer
  end

  def view_menu
    @menu_printer.print_menu
  end

  def add_to_order(item, quantity)
    @order.add_item(item, quantity)
    outstanding_balance
  end

  def delete_from_order(item, quantity)
    @order.remove_item(item, quantity)
    outstanding_balance
  end

  def outstanding_balance
    @checkout.balance(cart = @order.cart)
  end

  def pay_money(my_money)
    @checkout.payment(my_money)
    @delivery.process_text
  end

end
