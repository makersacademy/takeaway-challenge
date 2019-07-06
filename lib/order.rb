class Order
  def initialize(dishes = [], menu)
    @dishes = dishes
  end

  def choose(dish)
  end

  def total(menu)
    (@dishes.map { |dish| menu.price(dish) * dish.quantity }).sum
  end

  def quantity(dish)
    1
  end

  def list_dishes
    @dishes
  end

end
