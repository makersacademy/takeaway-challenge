require 'order'

class Takeaway

  def initialize(menu:, order: nil)
    @menu = menu
    @order = order || Order.new
  end

  def show_menu
    menu.print
  end

  def place_order(items)
    items.each do |item, quantity|
      order.add(item, quantity)
    end
    order.total
  end

  private

  attr_reader :menu, :order
end
