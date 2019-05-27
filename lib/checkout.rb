
class Checkout
  attr_accessor :basket

  def initialize
    @basket = []
  end

  def add(item, price)
    @basket << {food:item, cost:price}
  end

  @total = 0

  def total
    @basket.each{|item|
    puts "@@@@@"
    puts item[:cost] += total }
  end

end
