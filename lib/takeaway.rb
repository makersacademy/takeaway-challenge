require_relative 'order'

class TakeAway

  def initialize(menu:, order: nil)
    @menu = menu
    @order = order || Order.new
  end

  def read_menu
    menu.print
  end

  def place_order(dishes)
    dishes.each do |dish, quantity|
      order.add(dish, quantity)
    end
    order.total
  end

  private
  attr_reader :menu, :order
end
