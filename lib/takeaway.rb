require 'order'
class TakeAway

  def initialize(menu:, order: nil)
    @menu = menu
    @order = order || Order.new
  end

  def print_menu
    menu.print
  end

  def place_order(dishes)
    dishes.each do |dish, quantity|
      order.add(dish, quantity)
    end
    order.total
  end

def total
  item_totals
end
  private

  attr_reader :menu, :order

  def item_totals
    dish.map do |dish, quantity|
      menu.price(dish) * quantity
    end
  end

end
