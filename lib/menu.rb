class Menu

  attr_reader :dishes_available

  CURRENT_MENU = { "Duck Pancakes" => 4.99,
      "Chicken Chow Mein" => 3.85,
      "Egg Fried Rice" => 1.99,
      "Crispy Beef" => 4.55,
      "Coke" => 0.99
    }

  def initialize 
    @dishes_available = CURRENT_MENU
  end


end