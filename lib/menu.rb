
require_relative "menu_printer"

class Menu

  MENU_ITEMS = {

    Pizza: 10.00,
    Pasta: 12.50,
    Salad: 5.25,
    Fries: 4.00

  }.freeze

  attr_reader :printer, :dishes

def initialize(menu_printer = MenuPrinter.new)
  @printer = menu_printer
  @dishes = MENU_ITEMS
end

def show_dishes
  printer.format_(dishes)
  printer.print_items
end

def has?(food)
  dishes.find {|dish, price| dish == food.to_sym }
end

end
