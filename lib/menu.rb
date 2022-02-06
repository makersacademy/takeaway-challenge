class Menu
  attr_reader :dishes
  def initialize
    @dishes = { "Chicken Tikka" => 8.45, "Butter Chicken" => 7.25, "Lamb Korma" => 9.45,
     "Beef Kebab" => 9.25, "Egg Fried Rice" => 4.45, "Steamed Rice" => 4.45,
     "Crispy Broccoli" => 5.45, "Creamy Spinach" => 2.45, "Naan" => 8.45,
     "Papadom" => 1.45, "Cola" => 345 } 
  end
end
