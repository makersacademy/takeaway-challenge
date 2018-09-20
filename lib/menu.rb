class Menu
  attr_reader :menu_list, :menu_printer
  def initialize(menu_printer = MenuPrinter.new)
    @menu_list = {
      tortilla: 4,
      gazpacho: 3,
      pasta: 5,
      pizza: 5,
      lasagna: 6,
      salad: 4,
      coke: 2
    }
    @menu_printer = menu_printer
  end

  def display_menu
    menu_printer.display_menu(menu_list)
  end

  def dish_included?(dish)
    @menu_list.has_key?(dish)
  end

  def dish_price(dish)
    @menu_list[dish]
  end
end
