class Menu

  def initialize
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def list_dishes
    dish_list = ""
    @dishes.each { |dish| dish_list << "#{dish.name}: #{dish.price}\n" }
    dish_list
  end

end
