require './lib/takeaway'


class Order

  attr_reader :basket, :total

  def initialize
    @basket = Hash.new(0)
    @total = 0
    @takeaway = Takeaway.new
  end

  def add_item(dish, quantity = 1)
    @basket[dish] += quantity
  end

  def check_basket
    @basket
    @total << @basket.grep(Integer).reduce(0, :+)
  end
end
