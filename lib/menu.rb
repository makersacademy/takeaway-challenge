# $LOAD_PATH.unshift(File.dirname(__FILE__))
require 'csv'

class Menu

  def initialize(menu_file = 'lib/menus/kingkebab.csv')
    # @menu_file = menu_file
    @menu = {}
    load_menu(menu_file)
  end

  def display_menu
    @menu.dup
  end

  private

  def load_menu(menu_file)
    CSV.foreach(menu_file) do |line|
      item, price = line[0], line[1]
      add_to_menu(item, price)
    end
  end

  def add_to_menu(item, price)
    @menu[item] = price
  end

end
