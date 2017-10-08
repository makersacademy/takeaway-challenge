class Receipt
  require File.dirname(__FILE__) + '/defaults'
  
  def initialize (order = Order.new)
    @order = order
  end

  def to_s
    receipt = ""
    order.basket.selected_items.each{ |item, quantity| receipt << "#{item} x #{quantity}\n" if quantity > 0}
    receipt << "Total: #{Defaults::DEFAULT_CURENCY}#{'%.2f' % order.basket.calculate_total}"
  end

  attr_reader :order
end