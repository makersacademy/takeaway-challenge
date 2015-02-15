class Order

  attr_reader :basket

  def initialize
    @basket = {}
  end

  def add_to_order(dish, quantity)
    @basket[dish] = quantity
  end

  def total
    total = 0
    @basket.each {|item, quantity| total += item.price * quantity}
    total
  end

end