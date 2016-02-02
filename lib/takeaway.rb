
require_relative 'menu.rb'
require_relative 'calculate.rb'
require_relative 'mail.rb'
require_relative 'menulist.rb'
require_relative 'order.rb'
class Takeaway

attr_reader :menu

include Calculate_Order
include MenuList
include Mail
include Menu_Print

  def initialize(restaurant_type = :burger, order = Order.new)
    @menu = select(restaurant_type)
    @order_instance = order
  end

  def show_menu
    show(@menu)
  end

  def order(dish, quantity)
    @basket = []
    @basket = @order_instance.order_input(dish, quantity, @menu)
    @order = @basket + [[calculate(@basket, @menu)]]
  end

  def reset_order
    @order_instance.reset
  end

  def confirm_order (order_list = @order)
    fail "Incorrect Calculation" unless check_calculation(order_list, @menu)
    send
  end


end
