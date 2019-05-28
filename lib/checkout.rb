
class Checkout
  attr_accessor :basket

  def initialize
    @basket = []
    @total = 0
  end

  def add(item, price)
    @basket << {food:item, cost:price}
  end

  def total
    total = @basket.map { |item| item[:cost] }.sum
  end

end
