require_relative 'menu'
require_relative 'order'
require_relative 'display'

class Takeaway

  attr_reader :menu, :order, :display, :sms

  def initialize
    @order = Order.new
    @menu = @order.menu
    @display = Display.new
  end

  def show_menu
    @display.to_string(@menu.menu_list)
  end

  def place_order(dish_wanted, quantity = 1)
    @order.place(dish_wanted, quantity)
  end

  def checkout(estimate_total)
    @order.complete_order(estimate_total)
  end
end
