class Order

  def initialize(meal)
    @meal = meal
  end

  def choose(selection, quantity)
    @meal.add_dish(selection, quantity)
  end

  def price
    @meal.sum_of_basket
  end

  def current_order
    @meal.basket
  end

end
