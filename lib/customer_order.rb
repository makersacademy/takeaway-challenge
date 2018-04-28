class CustomerOrder

  attr_reader :selection

  def initialize(dishes = Dishes.new)
    @dishes = dishes
    @selection = []
  end

  def select_dish(dish, quantity)
    validate_dish(dish, quantity)
    @selection << [dish, quantity]
  end

  def validate_dish(dish, quantity)
    raise "Error: Dish is not in menu!" unless @dishes.in_menu?(dish)
    raise "Error: Invalid quantity!" unless quantity.is_a? Integer
  end
end
