require_relative 'menu.rb'
require_relative 'order.rb'

class Takeaway

  attr_reader :menu, :order

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def view_menu
    @menu.view
  end

  def select(item, quantity)
    @order.select(item, quantity)
  end

  def check_order
    @order.check_total
  end

end
