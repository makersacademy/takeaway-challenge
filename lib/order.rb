class Order
  attr_reader :basket, :total

  def initialize
    @basket = Hash.new(0)
  end

  def add_basket(item, num)
    basket[item] += num
  end

  def basket_summary(menu)
    basket.map { |item, num| "#{item} x#{num} = £#{sprintf('%.2f', menu.dishes[item] * num)}" }.join(', ')
  end

  def total(menu)
    @total = order.basket.map { |item, num| menu.dishes[item] * num }.inject(:+)
    "Total: £#{sprintf('%.2f', @total)}"
  end
end