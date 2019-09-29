require_relative 'menu'
require_relative 'order'

class User

  attr_reader :order_confirmed

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
    @order_confirmed = false
  end

  def view_menu
    @menu.menu
  end

  def select(item, quantity)
    @order.add_to_basket(item, quantity)
    "#{quantity} x #{item} added to order"
  end

  def view_order
    @order.order_list
  end

  def total
    "£#{@order.order_total}"
  end

  def confirm
    @order_confirmed = true
  end
end
#
# def text
#   sendtext() if order_confirmed
# end
