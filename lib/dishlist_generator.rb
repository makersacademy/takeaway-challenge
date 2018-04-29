require_relative './dish'

class DishlistGenerator

  def initialize(dish_class: Dish, menu_handler: MenuHandler.new)
    @dish_class = dish_class
    @menu_handler = menu_handler
  end

  def create_list(category)
    dishes = @menu_handler.menu_items(category)
    dish_list = []
    dishes.each do |dish|
      dish_list << create_dish(dish)
    end
    dish_list
  end

  private

  def create_dish(dish)
    @dish_class.new(dish)
  end

end
