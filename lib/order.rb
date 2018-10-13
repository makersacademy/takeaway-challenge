class Order

  attr_reader :basket

  def initialize
    @basket = Hash.new(0)
  end

  def add_dish(dish, quantity = 1)
    @basket[dish] += quantity
  end

end
