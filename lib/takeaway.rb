require "order"

class Takeaway

  def initialize(menu:, order: nil)
    @menu = menu
    @order = order || Order.new
  end

  def menu_display
    menu.display
  end

  def place_order(dishes)
    dishes.each do |dish,quantity|
      order.add(dish,quantity)
    end
  end

  private

  attr_reader :menu, :order
end
