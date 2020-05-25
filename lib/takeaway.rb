require_relative 'menu'
require_relative 'order'

class TakeAway

  attr_reader :menu

  def initialize
    @menu = Menu.new
    @order = Order.new
  end

  def seemenu
    @menu.menu
  end

  def orders(food)
    @order.sum_cost(food)
  end

  def see_order
    @order.summary
  end
end
