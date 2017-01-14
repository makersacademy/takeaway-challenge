class Order

  attr_reader :dishes, :total, :menu

  def initialize(menu)
    @dishes = {}
    @total = 0
    @menu = menu
  end

  def add_dish(dish_number, quantity)
    dishes[dish_number] = quantity
  end

  def expected_total(total)
    @total = total
  end

  private

  def find_dish(dish_number)
    # dish = @takeaway.menu

  end
end
