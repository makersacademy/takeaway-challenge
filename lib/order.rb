class Order
  attr_reader :basket

  def initialize
    @basket = Hash.new(0)
  end

  def add(food, quantity = 1)
    basket[food] += quantity
  end

end