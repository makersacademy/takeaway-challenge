require 'dish'

class Menu
  attr_reader :dishes
  DISHES = [['Tagliatelle with duck ragu', 9], ['Pizza Diavola', 10], ['Salad Caprese', 8.5]]
  def initialize
    @dishes = []
  end
  def build
    DISHES.each { | name_price | @dishes.push Dish.new name_price[0], name_price[1] }
  end
  def see
    menu_text = @dishes.map { |dish| dish.readable }.join("\n")
    puts menu_text
    menu_text
  end
end
