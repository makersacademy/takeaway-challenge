require "order"

class Takeaway

  def initialize(menu:, order: nil)
    @menu = menu
    @order = order
  end

  def print_menu
    # the double in the test allows us to define print without creating it yet
    @menu.print
  end

  def place_order(dishes)
    dishes.each do |dish, quantity|
      order.add(dish, quantity)
    end
  end

  private

  attr_reader :menu, :order
end
