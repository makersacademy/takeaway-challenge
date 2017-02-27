require_relative 'order'

class Takeaway

attr_reader :menu, :order

  def initialize(menu:, order: nil)
    @menu = menu
    @order = order || Order.new
  end

  def show_menu
    menu.to_string
  end

  def place_order(items)
    items.each do |item, quantity|
      order.add_item(item, quantity)
    end

  end
end
