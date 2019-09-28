require 'order'

class Restaurant

  def initialize(menu:, order: nil)
    @menu = menu
    @order = order
  end

  def print_menu
    menu.print
  end

  def place_order(items)
    items.each do |item, quantity|
      order.add(item, quantity)
    end
  end

  private

  attr_reader :menu, :order

end
