require 'csv'

class Menu

  attr_reader :current_menu

  def initialize(menu_file = "./lib/menus/current_menu.csv")
    @menu_file = menu_file
    load_menu
  end

  def load_menu
    @current_menu = []
    CSV.foreach(@menu_file) do |line|
      food = line[0]; price = line[1]
      @current_menu << { food: food, price: price.to_i }
    end
  end
end
