require_relative "order"

class TakeAway
  def initialize(menu:, order: nil)
    @menu = menu
    @order = order || Order.new
  end

  def show_menu
    menu.print
  end

  def place_order(dishes)
    dishes.each do | dish, quantitiy |
      order.add(dish, quantitiy)
    end
  end

private
  attr_reader :menu, :order
end
