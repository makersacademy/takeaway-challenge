class DishList

  def initialize(dish_class)
    @dish_class = dish_class
    @dishes = []
  end

  def add_dish(dish_data)
    dish = @dish_class.new(name: dish_data[0], price: dish_data[1])
    @dishes << dish
  end

  def dishes
    @dishes.dup
  end
end
