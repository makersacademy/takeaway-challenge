require_relative 'dish'

class Menu
  attr_reader :dishes
  def initialize(dish_class = Dish)
    @dishes = build_menu(dish_class)
  end

  def build_menu(dish_class)
    dish1 = dish_class.new(1, 'Chicken Tika', 5)
    dish2 = dish_class.new(2, 'Veggie Pizza', 10)
    dish3 = dish_class.new(3, 'Lamb Kebab', 7)
    [dish1, dish2, dish3]
  end
end
