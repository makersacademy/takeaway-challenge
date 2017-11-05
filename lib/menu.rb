class Menu

#attr_reader :dish, :price

MENU_LIST = { "margherita pizza" => 9, "mushroom pizza" => 11 }

def initialize
  MENU_LIST
  #@dish = dish
  #@price = price
end

def give_menu
  MENU_LIST
end


end
