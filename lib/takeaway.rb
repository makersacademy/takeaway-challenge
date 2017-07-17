require 'order'

class TakeAway

  def initialize(menu:, order: nil)
    @menu = menu
    @order = order || Order.new(menu)
  end

  def read_menu
    menu.read
  end

  def place_order(dishes)
    dishes.each do |dish, quantity|
      order.add(dish, quantity)
    end
  end

  private

  attr_reader :menu, :order
end
