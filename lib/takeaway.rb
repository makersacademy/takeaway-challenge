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

  def add_to_order(dish)
    @current_order.add_to_order(dish)
  end

  def view_order
    @current_order.items.map { |item|
      "#{item[:quantity]} #{item[:dish].name} @ %.2f" % item[:dish].price
    }.join "\n"
  end
end
