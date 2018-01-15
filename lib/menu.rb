class Menu
  attr_reader :menu

  DEFAULT_MENU = {
    "Bombay aloo" => 3.25,
    "Dal tadka" => 3.35,
    "Boiled rice" => 2.00,
    "Fried rice" => 3.00,
    "Naan" => 1.50,
    "Lassi" => 3.00,
    "Juice" => 2.00
  }
  def initialize(items = DEFAULT_MENU)
    @menu = items
  end

  def read_menu
    @menu
  end

  def price_of_dish(dish)
    @menu[dish]
  end
end
