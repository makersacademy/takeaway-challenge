require_relative 'menu'

class MenuPrinter
  def initialize(dish_list_printer)
    @dish_list_printer = dish_list_printer
  end

  def print(menu)
    raise "Invalid menu" unless menu.is_a? Menu
    puts menu.name.split.map(&:capitalize).join(' ')
    @dish_list_printer.print(menu.dishes)
  end
end
