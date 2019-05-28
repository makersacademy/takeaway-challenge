
class Checkout
  attr_accessor :basket

  def initialize
    @basket = []
    @total = 0
  end

  def add(item, cost)
    @basket << {food:item, price:cost}
  end

  def total
    total = @basket.map { |item| item[:price] }.sum
  end

end
