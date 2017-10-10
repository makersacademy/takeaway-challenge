class Receipt
  DEFAULT_CURENCY = "£"

  def initialize(order = Order.new)
    @order = order
  end

  def to_s
    receipt = purchased_items.map { |item, quantity| "#{item} x #{quantity}" if quantity > 0 }.join("\n")
    receipt << "\nTotal: #{DEFAULT_CURENCY}#{'%.2f' % total_cost}"
  end

  private
  attr_reader :order

  def purchased_items
    order.basket.selected_items
  end

  def total_cost
    order.basket.calculate_total
  end
end
