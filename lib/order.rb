class Order
  attr_reader :dishes

  def initialize
    @dishes = Hash.new(0)
  end

  def add_dish(dish, quantity = 1)
    @dishes[dish] += quantity
  end

  def total_price
    total_price = 0
    @dishes.each { |dish, quantity| total_price += dish.price * quantity }
    total_price
  end

end
