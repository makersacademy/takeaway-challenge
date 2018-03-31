require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :menu, :current_order
  def initialize(menu = Menu.new, current_order = nil)
    @menu = menu
    @current_order = current_order
  end

  def show_menu
    @menu.print_menu
  end

  def order(item, quantity = 1)
    @menu.contains?(item)
    order_helper(item, quantity)
    "#{quantity}x #{item}(s) added to your order."
  end

  def order_summary
    @current_order.summary
  end

  def total
    "Your total is: $#{@current_order.total}"
  end

  private

  def order_helper(item, quantity)
    @current_order = Order.new if @current_order.nil?
    @current_order.add(item, @menu.dishes[item], quantity)
  end

end
