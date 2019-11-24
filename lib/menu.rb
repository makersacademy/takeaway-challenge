class Menu

  def initialize(menu = MENU)
    @menu = menu
  end

  MENU = {
    "Banana pancakes with maple syrup" => 7.95,
    "Brunch burger" => 7.50,
    "Veggie breakfast burrito" => 8.95,
    "Triple tacos" => 7.95,
    "Diner fries" => 3.20,
    "Side of mac and cheese" => 4.25,
    "Coca cola" => 2.00,
    "Fresh orange juice" => 1.95
  }

  def display
    @menu
  end

end
