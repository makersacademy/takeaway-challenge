require 'order'

class Restaurant

  def initialize(menu:, order: nil)
    @menu = menu
    @order = order || Order.new
  end

  def show_menu
    menu.print_menu
  end

  def place_order(menu_items)
    menu_items.each do |item, quantity|
      order.add(item, quantity)
    end
    order.total
  end

  private

  attr_reader :menu, :order

end
