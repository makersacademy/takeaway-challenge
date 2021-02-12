class Menu
  attr_reader :meals

  PIZZERIA = {
    marinara:    8,
    margherita:  10,
    bufalina:    13,
    diavola:     14,
    napoli:      14,
    calzone:     14,
    fiorentina:  14,
    capricciosa: 15
  }

  def initialize(meals = PIZZERIA)
    @meals = meals
  end
end
