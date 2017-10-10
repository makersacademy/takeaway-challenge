class Receipt
  DEFAULT_CURENCY = "£"

  attr_reader :order
  
  def initialize(order = Order.new)
    @order = order
  end

  def to_s
    receipt = ""
    order.basket.selected_items.each { |item, quantity| receipt << "#{item} x #{quantity}\n" if quantity > 0 }
    receipt << "Total: #{DEFAULT_CURENCY}#{'%.2f' % order.basket.calculate_total}"
  end

end
