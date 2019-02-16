class Dish
  attr_reader :dish_number, :dish_name, :dish_cost
  def initialize(dish_number, dish_name, dish_cost)
    @dish_number = dish_number
    @dish_name = dish_name
    @dish_cost = dish_cost
  end
end
