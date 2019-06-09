require_relative './menu_printer.rb'
require_relative './dish.rb'

class Menu

  def initialize
    @items = {}
  end

  def get(index)
    all[index]
  end

  def add(name, price, dish_class = Dish)
    @items[name.to_sym] = dish_class.new(name, price)
  end

  def print(menu_printer = MenuPrinter)
    menu_printer.print(all)
  end

  def get_dish_by_name(name)
    all[name.to_sym]
  end

  private
  def all
    @items
  end

end
