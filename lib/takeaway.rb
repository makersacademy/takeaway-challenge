require_relative 'menu'
require_relative 'current_order'
require_relative 'checkout'

class Takeaway

  attr_reader :order

  def initialize menu=Menu.new, order=CurrentOrder.new
    @menu = menu
    @order = order
  end

  def view_menu
    @menu.show_menu
  end

  def place_order selection, quantity=1
    return "Sorry, we don't currently offer that dish" if invalid_entry? selection
    order.create_order selection, quantity
  end

  def view_order
    @order.view_order
  end

  def checkout
    return "Sorry, you haven't placed an order yet!" if order_not_placed?
    checkout = Checkout.new
    @order.reset_order! if checkout.confirm_order
  end

  private

  def invalid_entry? selection
    @menu.menu.each do |hash_entry|
      return false if hash_entry.has_key? selection
    end
    true
  end

  def order_not_placed?
    @order.customer_order.length == 0
  end

end
