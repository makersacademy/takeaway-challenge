require_relative './dish'

class Dishlist_generator

  def initialize(dish_class: Dish, menu_handler: Menu_handler.new)
    @dish_class = dish_class
    @menu_handler = menu_handler
    @dishes = []
  end

  def create_list(category)
    dishes = @menu_handler.get__menu_items(category)
    dishes.each do |dish|
      @dishes << create_dish(dish)
    end
  end

  def dishes
    @dishes.dup
  end

  private

  def create_dish(dish)
    @dish_class.new(dish)
  end

end
