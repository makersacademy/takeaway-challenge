require_relative 'menu'
require_relative 'pretty_format'
require_relative 'order'
require_relative 'send_sms'
require_relative 'terminal_io'

class Takeaway

  include SMS
  include Menu
  include PrettyFormat
  include TerminalIO

  def initialize
    welcome
    menu
  end

  def menu
    pretty_format(ALL_DISHES)
  end

  def order(dish, quantity, total_cost)
    raise "Total cost given does not match calculated order total" if order_error?(dish, quantity, total_cost)
    @current_order ||= Order.new
    @current_order.add(dish, quantity)
    confirm_add
  end

  def basket
    basket_title
    pretty_format(@current_order.basket, @current_order.total)
  end

  def checkout
    raise "Your basket is currently empty" if !@current_order
    basket
    confirm_sms
    send
  end

  private

  def order_error?(dish, quantity, total_cost)
     (ALL_DISHES.values[(dish - 1)].to_f * quantity) != total_cost
  end

  def confirm_add
    menu
    confirm_add_title
    basket
  end

end
