require_relative 'order'

class Takeaway
  attr_reader :current_order

  def initialize(menu)
    @menu = menu
  end

  def view_menu
    @menu.view
  end

  def start_order
    @current_order = Order.new
  end

  def view_order
    @current_order.items.map { |item|
      "#{item.quantity} #{item.dish.name} @ #{item.dish.price}"
    }.join "\n"
  end
end
