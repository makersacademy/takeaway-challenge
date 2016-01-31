
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
include Order

  def initialize(restaurant_type = :burger)
    @menu = select(restaurant_type)
  end

  def show_menu
    show(@menu)
  end

  def order
    order = order_input(@menu)
    @order = order << [calculate(order, @menu)]
  end

  def confirm_order (order_list = @order)
    fail "Incorrect Calculation" unless check_calculation(order_list, @menu)
    send
  end


end
