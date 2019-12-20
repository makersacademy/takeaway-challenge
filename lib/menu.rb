class Menu
  attr_reader :dishes
  DISHES_LIST = {
    "Chicken Rice" => 0.99,
    "Fried Chicken" => 2.99,
    "Fried Rice" => 1.99,
    "Side Salad" => 0.79,
    "Noodle Soup" => 2.99
  }

  def initialize
    @dishes = DISHES_LIST
  end
  def print_menu
      @dishes.each { |dish, price| "#{dish}: £#{price}, " }
  end
end
