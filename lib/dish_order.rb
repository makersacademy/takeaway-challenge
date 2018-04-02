require_relative './dish'

class DishOrder
  attr_reader :count
  attr_reader :dish

  def initialize(dish = Dish.new, count = 1)
    @dish = dish
    @count = count
  end
end
