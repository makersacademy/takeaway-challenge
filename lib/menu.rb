require_relative 'dish'

class Menu

  def initialize(dishes = {1 => "Chips", 2 => "Fish", 3 => "Salad"})
    @dishes = dishes
  end

  def list
    "Chips: £3 \nFish: £5\nSalad: £2"
  end
end
