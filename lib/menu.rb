require_relative './menu_printer.rb'

class Menu

  def initialize(dish = Dish)
    @dish = dish
    @items = []
  end

  def get(index)
    all[index]
  end

  def add(dish)
    @items << dish
  end

  def print(menu_printer = MenuPrinter)
    menu_printer.print(all)
  end



  private
  def all
    @items
  end

end