require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :menu, :order

  def initialize(menu:, order: nil)
    @menu = menu
    @order = order
  end

  def print_menu
    @menu.print
  end

  def place_order(dishes)
    add_dishes(dishes)
    order.total
  end

  def add_dishes(dishes)
    dishes.each do |dish, quantity|
      order.add(dish, quantity)
    end
  end

end
