require_relative './dish.rb'

# This is a menu, it is populated with dish objects.
class Menu
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dishes_to_menu(*dishes)
    dishes.each { |dish| @dishes << dish }
  end

  def remove_dish_from_menu(*dishes)
    dishes.each { |dish| @dishes.delete(dish) }
  end
end
