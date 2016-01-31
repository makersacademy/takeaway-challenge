class Order

  attr_reader :cost

  def initialize
    @cost = 0
  end

  def add(price)
    @cost += price
  end

  def reset
    @cost = 0
  end

end
