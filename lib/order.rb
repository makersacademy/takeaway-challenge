class Order

  def initialize
    @basket = {}
  end

  attr_reader :basket

  def add(item, quantity)
    @basket[item] = quantity
  end

end
