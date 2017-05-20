
require_relative './dish'
require_relative './order'

# This is a menu, it is populated with dishes.
class Menu
  attr_reader :dishes

  def initialize
    @dishes = []
    @printer = Printer.new
  end

  def add_dishes(*dishes)
    dishes.each { |dish| @dishes << dish }
  end

  def remove_dishes(*dishes)
    dishes.each { |dish| @dishes.delete(dish) }
  end

  def show_menu
    @printer.print(self)
  end

end
