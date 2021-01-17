require_relative 'dish_filter'

class Order
  include DishFilter

  MINIMUM_QUANTITY = 1

  attr_accessor :dishes

  def initialize
    @dishes = []
  end

  def add_dish(dish, quantity = MINIMUM_QUANTITY)
    got_dish = find_by_id(@dishes, dish["id"])

    if got_dish != nil
      got_dish["quantity"] += quantity
    else
      dish["quantity"] = quantity
      @dishes << dish
    end
  end

  def order_total
    total = 0

    @dishes.each do |dish|
      dish_total = dish["price"] * dish["quantity"] 
      total += dish_total
    end

    total
  end

end
