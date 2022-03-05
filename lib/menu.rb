class Menu

  MENU_HASH = { "Vegan Burger" => 15,
    "Ealing + Chips" => 15,
    "Honest + Chips" => 14,
    "Tribute + Chips" => 14,
    "Guinness Fondue + Chips" => 15,
    "Beef + Mature Cheddar + Chips" => 13,
    "Chicken + Chips" => 13
  }.freeze
 
  def menu
    MENU_HASH
  end

  def display_menu_card
    count = 0
    MENU_HASH.each do |key, value|
      puts "#{count + 1}. #{key}, #{value}"
      count += 1
    end

  end

end
