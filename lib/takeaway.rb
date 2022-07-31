require 'menu'
require 'order'

class Takeaway

  def initialize(menu:, order: nil)
    @order = order || Order.new
    @menu = menu
  end

  def print_menu
    menu.print
  end

  def place_order(dishes)
    dishes.each do |dish, quantity|
      @order.add(dish, quantity)
    end
  end

  private

  attr_reader :menu # menu accessible
end
