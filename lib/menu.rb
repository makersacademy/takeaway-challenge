class Menu
  def initialize(dish_list = [])
    @dishes = dish_list
  end

  def dishes
    @dishes.dup
  end

  def add_dish(dish)
    @dishes << dish
  end
end
