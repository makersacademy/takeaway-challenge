class Order

  def initialize(meal = Meal.new)
    @meal = meal
    menu
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

  private

  def menu
    @meal.menu.list
  end

end
