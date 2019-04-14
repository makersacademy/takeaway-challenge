require_relative 'order'
require_relative 'takeaway'

class Menu
  attr_reader :dishes, :price

  def menu
    {
      "Chicken bits" => 5,
      "Burger" => 5,
      "Pizza" => 8,
      "Chips" => 3
    }
  end
end
