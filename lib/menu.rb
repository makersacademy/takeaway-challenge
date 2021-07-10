require_relative 'dish'

class Menu
  attr_reader :dishes
  DISHES = {
    'Green Curry' => 7,
    'Red Curry' => 7,
    'Yellow Curry' => 7,
    'Pad Thai' => 8,
    'Spring Rolls' => 6,
    'Plain Rice' => 2,
    'Garlic Rice' => 2,
    'Prawn Crackers' => 1
  }

  def initialize
  end

  def show
  end
end
