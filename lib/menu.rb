require_relative 'dish'

class Menu
  def initialize(dish_class = Dish)
    @dish_class = dish_class
    @dishes = {
      Fries: 3.0,
      Burger: 8.0,
      CocaCola: 1.5}
  end

  def dishes
    @dishes.dup
  end
end
