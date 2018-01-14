require 'menu'

class MenuPrinter
  def initialize(dish_printer)
    @dish_printer = dish_printer
  end

  def print(menu)
    raise "Invalid menu" unless menu.is_a? Menu
    puts menu.name.split.map(&:capitalize).join(' ')
    menu.dishes.each do |dish|
      @dish_printer.print(dish)
    end
  end
end