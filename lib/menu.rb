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

  def remove_dish(dish)
    @dishes.delete(dish)
  end

  def select_dish(dish)
   index = @dishes.index(dish)
   @dishes[index]

  end

end
