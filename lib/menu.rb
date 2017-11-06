class Menu

attr_reader :selected_dish

MENU_LIST = { "margherita pizza, price:" => 9, "mushroom pizza, price:" => 11, "summer veggies pizza, price:" => 12}

def initialize
  @selected_dish = []
  #@price = price

end


def give_menu
  MENU_LIST
end

def select_dish
  MENU_LIST.each do |key, value|
    @selected_dish <<

end

end
