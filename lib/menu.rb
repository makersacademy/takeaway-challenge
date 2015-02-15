class Menu

  attr_reader :dish_list

  def initialize
    @dish_list = []
  end

  def add_dish(dish)
    @dish_list << dish
  end

end