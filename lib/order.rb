class Order
  attr_reader :basket

  def initialize
    @basket = Hash.new(0)
    @order_total = 0
  end

  def add(item, quantity)
    basket[item] += quantity
  end

  def order_total
    basket.values.inject(:+)
  end

  private

  def total_correct?(number)
    order_total == number
  end
end
