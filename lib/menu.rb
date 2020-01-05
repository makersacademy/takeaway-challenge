# this class is in charge of making the menu, adding items and price

class Menu

  MENU = { 
    "Vegemite Toast" => 4, "Fairy Bread" => 3.5,
    "Sausage Sizzle" => 5, "Lamington" => 2, "Milo" => 2.5,
    "Iced Coffee" => 4, "Flat White" => 3
  }

  attr_reader :menu

  def initialize
    @menu = MENU
  end

  def price(food)
    MENU[food]
  end

end
