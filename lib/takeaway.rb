require 'order'

class Takeaway

  attr_reader :menu, :order

  def initialize(menu:, order: nil)
    @menu = menu
    @order = order || Order.new
  end

  def print_menu
    menu.print_menu
  end

  def place_order(dishes)
    dishes.each do |dish, number|
      order.add(dish, number)
    end
    order.total
  end
end
