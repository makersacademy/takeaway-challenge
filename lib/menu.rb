class Menu

  def initialize(dish = Dish.new)
    @dish = dish
    @list_of_dishes = []
  end

  def print_menu
    @list_of_dishes << @dish
    @list_of_dishes
  end

end