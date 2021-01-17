class Order
  attr_reader :dishes

  def initialize
    @dishes = {}
  end

  def add(dish, quantity)
    dishes[dish] = quantity
  end

  def total
    item_total.inject(:+)
  end
end
