require 'csv'

class Menu

  def initialize(menu_file = 'lib/menus/kingkebab.csv')
    @menu = {}
    load_menu(menu_file)
  end

  def display_menu
    menu.dup
  end

  private

  attr_reader :menu

  def load_menu(menu_file)
    CSV.foreach(menu_file) do |line|
      item = line[0]
      price = line[1]
      add_to_menu(item, price)
    end
  end

  def add_to_menu(item, price)
    @menu[item] = price
  end

end
