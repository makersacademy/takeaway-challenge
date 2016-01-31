class Menu
  attr_reader :dishes
  
  def initialize
    @dishes = {"Salted Chilli Ribs" => 5.10,
               "Spring Roll" => 1.50,
               "Prawn Toast" => 2.50,
               "Scallops With Ginger & Spring Onion" => 5.60,
               "Chicken in Blackbean" => 4.80,
               "Egg Fried Rice" => 1.90}
  end
end