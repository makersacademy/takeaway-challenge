class Menu
  attr_reader :meals

  def initialize(meals = PIZZA)
    @meals = meals
  end

  PIZZA = {
    marinara:    8,
    margherita:  10,
    bufalina:    13,
    diavola:     14,
    napoli:      14,
    calzone:     14,
    fiorentina:  14,
    capricciosa: 15
  }
end
