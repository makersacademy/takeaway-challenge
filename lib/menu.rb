require_relative './dish'
require_relative './printer'

# This is a menu, it is populated with dishes.
class Menu
  attr_reader :dishes

  def initialize
    @dishes = []
    @printer = Printer.new
  end

  def add_dishes_to_menu(*dishes)
    dishes.each { |dish| @dishes << dish }
  end

  def remove_dish_from_menu(*dishes)
    dishes.each { |dish| @dishes.delete(dish) }
  end

  def view_menu
    @printer.print_menu(self)
  end
end
