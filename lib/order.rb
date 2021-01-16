class Order

  MINIMUM_QUANTITY = 1

  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish(dish, quantity = MINIMUM_QUANTITY)
    got_dish = get_dish(dish["id"])

    if got_dish != nil
      got_dish["quantity"] += quantity
    else
      dish["quantity"] = quantity
      @dishes << dish
    end
  end

  private

  def get_dish(id)
    for dish in @dishes
      return dish if id == dish["id"]
    end

    return nil
  end

end
