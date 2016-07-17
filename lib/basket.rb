class Basket

  attr_reader :basket

  def initialize
    @basket = {}
  end

  def add_item(item, cost, num)
     @basket["#{item} x #{num}"] = cost*num
  end

  def sum
  @basket.values.inject(0) { |a, b| a + b }
  end

end
