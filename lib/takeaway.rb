require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :menu, :order

  def initialize
    @order = Order.new
    @menu = @order.menu
  end

  def show_menu
  end

  def place_order(dish_wanted, quantity = 1)
    @order.place(dish_wanted, quantity)
  end

  def checkout(estimate_total)
    @order.complete_order(estimate_total)
  end
end
