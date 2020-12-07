class Menu
  def initialize(dish_class = Dish)
    @dish_class = dish_class
    @menu = []
  end

  def see
    @menu
  end

  def add_dish(name, price)
    @menu << @dish_class.new(name, price)
  end
end
