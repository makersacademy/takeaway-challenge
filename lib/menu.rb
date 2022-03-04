class Menu

  MENU_HASH = { "Vegan Burger" => 15,
    "Ealing + Chips" => 15,
    "Honest + Chips" => 14,
    "Tribute + Chips" => 14,
    "Guinness Fondue + Chips" => 15,
    "Beef + Mature Cheddar + Chips" => 13,
    "Chicken + Chips" => 13
  }.freeze
    
  def display_menu
    MENU_HASH
  end

  def price(dish)
    return "£#{MENU_HASH[dish]}"
  end

end
