require_relative 'menu'
require_relative 'order'

class TakeAway

  attr_reader :menu, :order

  def initialize
    @menu = Menu.new
    @order = Order.new
  end

  def seemenu
    @menu.menu
  end

  def order(food, amount)
    @order.order_add(food, amount)
  end

  def see_order
    @order.summary
    @order.value
  end
end
