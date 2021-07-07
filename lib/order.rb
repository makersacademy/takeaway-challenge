require_relative 'menu'

class Order
  attr_reader :basket, :dishes

  def initialize
    @basket = []
    @dishes = Menu.new
  end

  def add_to_basket(dish, qty = 1)
    qty.times { @basket << dish }
  end

  # incomplete method - test does not pass
  def total_price
    @basket.map { |x| (x * dishes.values).sum }
  end
end
