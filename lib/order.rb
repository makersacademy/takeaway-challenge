class Order
  attr_reader :list
  def initialize
    @list = Hash.new(0)
  end

  def add(dish, amount = 1)
    @list[dish] += amount
  end
end
