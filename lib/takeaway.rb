require_relative "menu"
require "order"


class Takeaway

  def initialize(menu:, order: nil)
    @order = order || Order.new
    @menu = menu
  end

  def place_order(dishes)
    dishes.each do |dish, quantity|
      order.add_to_order(dish, quantity)
    end
  end

  def print_menu
    menu.print_menu
  end

private

attr_reader :menu, :order
end
