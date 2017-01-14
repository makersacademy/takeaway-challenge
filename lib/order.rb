class Order

  attr_reader :dishes, :total, :takeaway

  def initialize(takeaway)
    @dishes = {}
    @total = 0
    @takeaway = takeaway
  end

  def add_dish(dish_number, quantity)
    dishes[dish_number] = quantity
  end

  def expected_total(total)
    @total = total
  end

  private

  def find_dish(dish_number)


  end
end
