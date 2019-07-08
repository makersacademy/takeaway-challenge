class Order

  attr_reader :food

  def initialize
    @food = { }
  end

  def add(dish, num)
    food[dish] = num
  end

end
