class Menu

  def initialize
    @dish_list = []
  end

  def show_menu
    dish_list
  end

  def add_dish(dish)
    dish_list << dish
  end

  private
  attr_reader :dish_list

end
