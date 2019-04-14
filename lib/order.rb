class Order
attr_reader :basket

  def initialize
    @basket = {}
  end

  def add(meal, quantity)
    @basket[meal] = quantity
  end
end
