class Order

  attr_reader :ordered_dishes, :total, :menu

  def initialize(menu)
    @ordered_dishes = {}
    @total = 0
    @menu = menu
  end

  def add_dish(dish_number, quantity)
    ordered_dishes[dish_number] = quantity
  end

  def expected_total(total)
    @total = total
  end

  private

  def find_dish(dish_number)
    # dish = @takeaway.menu

  end
end
