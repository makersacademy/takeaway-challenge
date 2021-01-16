class Order

  MINIMUM_QUANTITY = 1

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish(dish, quantity = MINIMUM_QUANTITY)
    dish["quantity"] = quantity

    @dishes << dish
  end

end
