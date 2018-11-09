require_relative 'order'

class Takeaway
  def initialize(menu)
    @menu = menu
  end

  def view_menu
    @menu.view
  end

  def start_order
    @current_order = Order.new
  end

  def add_to_order(dish, quantity = 1)
    start_order unless @current_order
    @current_order.add_to_order(dish, quantity)
  end

  def view_order
    raise 'There is currently no order open' unless @current_order
    print format_order
  end

  private

  def format_order
    @current_order.items.map { |item|
      qty = item[:quantity]
      name = item[:dish].name
      price = item[:dish].price
      "#{qty} #{name} @ %.2f".ljust(20).concat("%.2f".rjust(6)) \
        % [price, (qty * price)]
    }.join "\n"
  end
end
