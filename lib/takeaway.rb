require_relative './menu.rb'
require_relative './order.rb'

class Takeaway
  attr_reader :current_order

  def initialize(menu = Menu.new, order_class = Order)
    @menu = menu
    @order_class = order_class
  end

  def start_order
    @current_order = @order_class.new
  end

  def see_menu
    @menu.see_menu
  end
end