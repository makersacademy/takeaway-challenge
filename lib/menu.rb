class Menu

  MENU = {
    "Hamburger" => 4.99, 
    "Hot Dog" => 4.49, 
    "Cheeseburger" => 5.49,
  }
  
  attr_reader :menu

  def initialize
    @menu = MENU
  end

end
