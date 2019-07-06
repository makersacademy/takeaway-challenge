class Order
  def initialize(dishes = [])
    @dishes = dishes
  end

  def choose(dish)
  end

  def total
    (list_dishes.each { |dish| menu.price(dish) * order.quantity(dish) }).sum
  end

  def quantity(dish)
    1
  end

  def list_dishes
    @dishes
  end

end
