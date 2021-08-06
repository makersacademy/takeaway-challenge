class Menu

  MENU = {
    "Hamburger" => 4.99, 
    "Hot Dog" => 4.49, 
    "Cheeseburger" => 5.49
  }
  SPACING = 16
  
  def initialize
    @menu = MENU
  end

  def menu_hash
    @menu
  end

  def view_menu
    MENU.map { |dish, price| printf "%-#{SPACING}s %s\n", dish, price }.join
  end

end
