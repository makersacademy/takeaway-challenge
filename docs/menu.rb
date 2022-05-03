require './docs/order'

class Menu

  attr_reader :menu

  def initialize
    @menu = { 
      "Guinness" => 6.00,
      "Espresso Martini" => 12.50,
      "Ruddles" => 1.99,
      "Huel" => 3.00 }
  end

  def show_menu
    @menu
  end

end
