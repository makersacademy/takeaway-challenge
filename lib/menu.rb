require_relative 'takeaway'
require_relative 'order'

class Menu
  attr_reader :dishes, :price

  def menu
    {
      'Salmon Poke Bowl' => 8,
      'Tuna Poke Bowl' => 8,
      'Tofu Poke Bowl' => 8,
      'Chicken Poke Bowl' => 8,

      'Blue Hawaii Cocktail' => 7,
      'Mai Tai Cocktail' => 7,
      'Hawaiian Margarita Cocktail' => 7,
      'Mango Martini Cocktail' => 7
    }
  end
end
