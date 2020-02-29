require_relative 'menu'

class Takeaway

  attr_reader :menu, :order

  def initialize(menu:, order: nil)
    @menu = menu
    @order = order
  end

  def view_menu
    @menu.print
  end

  def place_order(items)
    items.each do |item, qty|
      order.add_item(item, qty)
    end
  end


end
