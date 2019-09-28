require_relative 'menu'
require_relative 'order_list'

class User

  def initialize(menu = Menu.new, order_list = OrderList.new)
    @menu = menu
    @order_list = order_list
  end

  def view_menu
    @menu.menu
  end

  def select(item, quantity)
    @order_list.add_to_order(item, quantity)
    "#{quantity} x #{item} added to order"
  end

end
# def intitialize
#   order_list = []
#   @menu = Menu.new
#   @order_list = Order.new
#   order_confirmed? = false
# end
#
# def view_menu
#   @menu
# end
#
# def select(item, quantity)
#   @order_list << { item => quantity }
    # (make pushing to order list a responsibility of orer_list class)
# end
#
# def my_order
#   @order_list
# end
#
# def confirm_order
#   order_confirmed = true
# end
#
# def text
#   sendtext() if order_confirmed
# end
