class Order
  attr_reader :basket, :total

  def initialize
    @basket = Hash.new(0)
  end

  def add_basket(item, quantity)
    basket[item] += quantity
  end

  def basket_summary(menu)
    basket.map { |item, quantity| "#{item} x#{quantity} = £#{sprintf('%.2f', menu.dishes[item] * quantity)}" }.join(', ')
  end

  def total(menu)
    @total = order.basket.map { |item, quantity| menu.dishes[item] * quantity }.inject(:+)
    "Total: £#{sprintf('%.2f', @total)}"
  end
end