class Menu
  attr_reader :menu_items

  MENU_ITEMS = { 
    "Small Fish" => 1.80,
    "Large Fish" => 3.60,
    "Small Chips" => 1.20,
    "Large Chips" => 2.00,
    "Sausage" => 0.80,
    "Mushy Peas" => 1.00,
    "Curry Sauce" => 1.00
  }

  def initialize(menu_items = MENU_ITEMS)
    @menu_items = menu_items
  end

  def open_menu
    menu_items.map { |meal, price| "#{meal}: £#{sprintf('%.2f', price)}" }
  end
  
end
