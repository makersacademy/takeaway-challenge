class Takeaway
  attr_accessor :order
  attr_reader :menu_ready
  def initialize menu

  end

  def total
    order_prices = []
    @order.each { |index| order_prices << @menu.values[index - 1] }
    total = order_prices.inject(:+)
  end
end

# p takeway = Takeaway.new(Menu.new)
# p takeway.show_menu