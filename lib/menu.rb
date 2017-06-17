
require "menu_printer"

class Menu

  attr_reader :menu_printer, :dishes

def initialize(menu_printer = MenuPrinter.new)
  @menu_printer = menu_printer
  @dishes = {Pizza: 10.00, Pasta: 12.50, Salad: 5.25, Fries: 4.00}
end

def show_dishes
  menu_printer.print_(dishes)
end

def check_can_order(dish)  # must be symbol
  dishes.keys.include?(dish)
end

end
