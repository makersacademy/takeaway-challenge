class Order
  attr_reader :basket

  def initialize
    @basket = Hash.new(0)
  end

  def add(food, quantity = 1)
    basket[food] += quantity
  end

  def remove(food)
    basket.include?(food) ? basket.delete(food) : "Item not in basket"
  end
  



end