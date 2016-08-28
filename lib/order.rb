class Order

attr_reader :basket

  def initialize
    @basket = {}
  end

  def add_dish(dish)
    !!@basket[dish] ? @basket[dish] += 1 : @basket[dish] = 1
  end

end
