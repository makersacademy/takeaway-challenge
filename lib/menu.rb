class Menu
attr_reader :dishes

def initialize
  @dishes = dishes = { "Wing Roulette" => 10.95, "Whole Chicken" => 13.25, "10 Chicken Wings" => 10.95,
     "Sunset Burger" => 7.95, "Supergrain Salad" => 6.50 }   
end

def display
  @dishes
end

end
