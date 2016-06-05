require_relative "menu"
require_relative "order"

class Takeaway

  def initialize(menu:, order: nil)
    @menu = menu
    @order = order || Order.new
  end

  def print_menu
    menu.print
  # Calls the instance method "print" from the Menu class on the value of the
  # menu variable.
  end

  def place_order(dishes)
    dishes.each { |dish, quantity |
      order.add(dish, quantity)
    }
  #
    order.total
  # Calls the instance method "total" from the Order class on the value of
  # the order variable.
  end

  private

  attr_reader :menu, :order

end
