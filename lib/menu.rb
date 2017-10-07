require 'dish'

class Menu
  attr_reader :dishes, :selection
  DISHES = [['Tagliatelle with duck ragu', 9], ['Pizza Diavola', 10], ['Salad Caprese', 8.5]]
  def initialize
    @dishes = DISHES.map { | name_price | Dish.new name_price[0], name_price[1] }
    @selection = []
  end
  def see
    menu_text = dishes.map(&:readable).join("\n")
    puts menu_text
    menu_text
  end
  def select dish_name
    matches = dishes.select { |dish| dish_name == dish.name }
    matches.length > 0 ? matches.each { |match| selection << match } : 'Sorry, that is not available'
  end
end
