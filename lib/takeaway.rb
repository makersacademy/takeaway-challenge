# Takeaway functionality: print menu and place an order

require 'order'

class Takeaway

  def initialize(menu:, order: nil)
    @menu = menu
    @order = order || Order.new
  end

  def print_menu
    menu.print
  end

  def place_order(dishes)
    dishes.each { |dish, quantity |
      order.add(dish, quantity)
    }
    order.total
  end

  private

  attr_reader :menu, :order
  # Delegation used here to delegate menu function to menu object

end
