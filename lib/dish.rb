class Dish
  attr_reader :menu_number, :dish_name, :dish_cost
  def initialize(menu_number, dish_name, dish_cost)
    @menu_number = menu_number
    @dish_name = dish_name
    @dish_cost = dish_cost
  end
end
