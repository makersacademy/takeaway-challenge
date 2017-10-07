require_relative 'dish'
require_relative 'menu_printer'

class Menu
  attr_reader :dishes, :selection, :menuprinter
  DISHES = [['Tagliatelle with duck ragu', 9], ['Pizza Diavola', 10], ['Salad Caprese', 8.5]]
  def initialize
    @dishes = DISHES.map { | name_price | Dish.new name_price[0], name_price[1] }
    @selection = []
    @menuprinter = MenuPrinter
    puts menuprinter.see dishes
  end
  def select dish_name, quantity
    matches = dishes.select { |dish| dish_name == dish.name }
    matches.length > 0 ? matches.each { |match| make_selection match, quantity } : 'Sorry, that is not available'
  end

  private

  def make_selection match, quantity
    match.quantity += quantity
    selection << match
  end
end
