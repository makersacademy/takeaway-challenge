class Menu
  attr_reader :menu

  DEFAULT_MENU = {
    "Naan" => 1.00,
    "Daal" => 4.50,
    "Rice" => 4.00,
    "Soup" => 3.00,
    "Channa" => 5.00
  }
  def initialize(menu = DEFAULT_MENU)
    @menu = menu
  end

  def read_menu
    @menu.each { |key, value| puts key + ' : ' + value.to_s }
  end

  def price_of_dish(dish)
    @menu[dish]
  end

end
