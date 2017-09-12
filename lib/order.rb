class Order
  attr_reader :basket

  def initialize
    @basket = {}
    @basket.default = 0
  end
  def add(item,quantity)
    @basket[item] += quantity
  end
end
