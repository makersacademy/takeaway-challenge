class Basket

  attr_reader :basket

  def initialize
    @basket = []
  end

  def add(item)
    @basket << item
  end

  def cost
    cost = 0
    basket.each { |item| cost += item[:price] }
    cost
  end

end
