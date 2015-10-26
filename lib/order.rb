class Order
  attr_reader :basket, :total

  def initialize
    @basket = Hash.new(0)
  end

  def add_basket(item, qty)
    basket[item] += quantity
  end

  def basket_summary(menu)
    basket.map { |item, qty| "#{item} x#{qty} = £#{sprintf('%.2f', menu.dishes[item] * qty)}" }.join(', ')
  end

  def total(menu)
    @total = order.basket.map { |item, qty| menu.dishes[item] * qty }.inject(:+)
    "Total: £#{sprintf('%.2f', @total)}"
  end
end