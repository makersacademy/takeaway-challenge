# tracks an Order
class Order
  attr_reader :selected_dishes, :total

  def initialize
    @selected_dishes = []
    @total = 10
  end

  def add_dish(dish)
    @selected_dishes << dish
  end
end
