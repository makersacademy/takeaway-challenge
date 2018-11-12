class Menu

attr_reader :dishes

  def initialize(dishes = CHICKEN_SHOP)
    @dishes = dishes
  end

  def view_dishes(restaurant)
    @dishes
  end

  CHICKEN_SHOP = {
    "1 piece chicken meal" => 4.49,
    "2 piece chicken meal" => 5.49,
    "chicken nuggets meal" => 4.49,
    "popcorn chicken meal" => 5.79,
    "spicy wings meal" => 5.49,
    "mega bucket meal" => 24.99 }

  # TACO_JOINT = {
  #   "tinga de pollo" => 1.50,
  #   "flor de calabaza" => 2.00,
  #   "la cubana" => 3.50,
  #   "al pastor" => 1.25,
  #   "carne asada" => 1.75,
  #   "pescado" => 2.50
  # }

end
