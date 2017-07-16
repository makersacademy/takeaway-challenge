class Order
  attr_reader :dishes

  def initialize
    @dishes = {}
  end

  def add_dish(dish_and_quantity)
    @total = dish_and_quantity.pop
    @dishes = Hash[*dish_and_quantity.flatten]
    check_total
  end

  def check_total
    fail "The total of #{@total} does not appear to match the sum of dishes ordered." unless @total == dishes.inject(0) { |sum, quantity| sum + quantity[1] }
  end

end
