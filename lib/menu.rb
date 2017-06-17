
require_relative "menu_printer"

class Menu

  attr_reader :printer, :dishes

def initialize(menu_printer = MenuPrinter.new)
  @printer = menu_printer
  @dishes = {Pizza: 10.00, Pasta: 12.50, Salad: 5.25, Fries: 4.00}
end

def show_dishes
  printer.print_(dishes)
end

def find(dish)
  dishes.find {|key, val| key == dish.to_sym }
end

end
