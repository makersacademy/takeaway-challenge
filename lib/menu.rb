class Menu

  attr_reader :dishes_available

  def initialize 
    @dishes_available = { "Duck Pancakes" => 4.99,
      "Chicken Chow Mein" => 3.80,
      "Egg Fried Rice" => 1.99,
      "Crispy Beef" => 4.55,
      "Coke" => 0.99
    }
  end


end