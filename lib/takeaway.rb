require_relative "menu"
require_relative "order"
require_relative "sms"

class Takeaway
  attr_accessor :menu, :order, :current_order

  def initialize(menu = Menu.new, order = Order, sms = SMS)
    @menu = menu
    @order = order
    @sms = sms
  end

  def show_menu
    print @menu.list
  end

  def add_to_order(dish)
    (@current_order = @order.new) unless @current_order
    fail "Sorry, dish is not available" unless dish_exists?(dish)
    @current_order.add({ dish => @menu.dishes[dish] })
  end

  def finalize_order(sms = @sms.new)
    @current_order = nil
    sms.send_sms
  end

private

  def dish_exists?(dish)
    @menu.dishes.has_key?(dish)
  end
end


