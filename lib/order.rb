class Order

  attr_reader :ordered_dishes, :expected_order_total, :menu

  def initialize(menu)
    @ordered_dishes = {}
    @expected_order_total = 0
    @menu = menu
  end

  def add_dish(dish_number, quantity)
    ordered_dishes[find_dish(dish_number)] = quantity
  end

  def expected_total(total)
    @expected_order_total = total
  end

  private

  def find_dish(dish_number)
    dish = menu.dishes[(dish_number - 1)]
  end
end
