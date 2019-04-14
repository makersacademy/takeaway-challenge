
require_relative 'order'

class Takeaway

  def initialize(menu:, order: nil)
    @menu = menu
    @order = order
  end

  def print_menu
    menu.print
  end

  def place_order(dishes)
    dishes.each do |dishes, quantity|
      order.add(dishes, quantity)
    end
  end

  private
  attr_reader :menu, :order

end
