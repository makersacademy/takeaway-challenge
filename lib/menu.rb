class Menu

attr_reader :menu

  MENU = { "Margarita" => 12,
  "The special" => 18,
  "Chicago classic"  => 18,
  "Meat & more meat" => 19,
  "Fresh spinach" => 14,
  "Super veggie" => 18,
  "Bacon bbq chicken" => 18,
  "Chicken sausage deluxe" => 18}


  def initialize
    @menu = MENU
  end

end
