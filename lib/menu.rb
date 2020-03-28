class Menu

  MENU_ITEMS = { 
    margherita: 7.99,
    four_cheese: 8.50,
    vegetarian: 9.99,
    meat_feast: 12.99,
    diavola: 12.99
  }

  def initialize
    @menu_items = MENU_ITEMS
  end

  def show_menu
    @menu_items
  end

end
