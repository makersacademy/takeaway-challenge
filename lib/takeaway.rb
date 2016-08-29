require_relative 'order'
require_relative 'confirmation'

class Takeaway

attr_reader :order_class, :current_order

  def initialize(order_class = Order)
    @order_class = order_class
    @current_order = nil
  end

  def start_order
    @current_order = order_class.new
    @current_order.menu.show_list
    puts "Awaiting your order!"
  end

  def order_food(item, quantity = 1)
    @current_order.select_dish(item, quantity)
  end

  def checkout(amount)
    fail "Payment amount doesn't equal the total" if amount_not_match?(amount)
    @current_order.order_summary
  end

private

  def amount_not_match?(amount)
    amount != @current_order.total
  end

end
