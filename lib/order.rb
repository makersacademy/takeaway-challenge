class Order

attr_reader :basket

  def initialize
    @basket = {}
  end

  def add_dish(number, dish)
    !!@basket[dish] ? @basket[dish] += number : @basket[dish] = number
  end

end
