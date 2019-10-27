

class Dish
  attr_reader :name, :price, :remaining_portions

  DEFAULT_PORTION_NUMBER = 5

  def initialize(name, price, remaining_portions = DEFAULT_PORTION_NUMBER)
    @name = name
    @price = price
    @remaining_portions = remaining_portions
  end

  def remove_portion
    @remaining_portions -= 1
  end
end
