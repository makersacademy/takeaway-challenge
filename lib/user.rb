require_relative 'menu'
require_relative 'order_list'

class User

  attr_reader :order_confirmed

  def initialize(menu = Menu.new, order_list = OrderList.new)
    @menu = menu
    @order_list = order_list
    @order_confirmed = false
  end

  def view_menu
    @menu.menu
  end

  def select(item, quantity)
    @order_list.add_to_basket(item, quantity)
    "#{quantity} x #{item} added to order"
  end

  def view_order
    @order_list.order_list
  end

  def confirm
    @order_confirmed = true
  end
end
#
# def text
#   sendtext() if order_confirmed
# end
