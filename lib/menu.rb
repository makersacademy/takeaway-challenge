class Menu

  def initialize(dish = Dish.new)
    @dish = dish
    @dishes = []
  end

  def print_menu
    @dishes << @dish
    @dishes
  end

end