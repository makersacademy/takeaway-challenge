require 'order'
class Takeaway
  attr_reader :menu
  def initialize(menu:, order: nil)
    @menu = menu
    @order = order || Order.new
  end

  def print_menu
    menu.print
  end

  def place_order(dishes)
    dishes.each do |dish, quan|
      order.add(dish, quan)
    end
    order.total
  end
  private

  attr_reader :menu, :order
end
