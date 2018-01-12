require_relative 'printer'
require_relative 'dish'

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

  def print_menu(printer = Printer.new)
    printer.print_menu(dish_list)
  end

  private
  attr_reader :dish_list

end
