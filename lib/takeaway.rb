require 'order'

class Takeaway
  attr_reader :menu, :order

  def initialize(menu:, order: nil)
    @menu = menu
    @order = order
  end

  def print_menu
    @menu.print
  end

  def place_order(meals)
    meals.each do |meal,quantity|
      @order.add(meal, quantity)
    end
    @order.total
  end
end
