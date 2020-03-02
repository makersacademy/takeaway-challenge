require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :menu, :order

  def initialize(menu:, order: nil)
    @menu = menu
    @order = order || Order.new(menu: menu)
  end

  def view_menu
    @menu.print
  end

  def place_order(items)
    items.each do |item, qty|
      order.add_item(item, qty)
    end
    order.order_total
  end


end
