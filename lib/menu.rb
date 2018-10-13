class Menu
  MENU = {
    "Quarter Chicken" => 4,
    "Half Chicken" => 8,
    "Whole Chicken" => 13,
    "Chicken Wing" => 1
  }

  def show_menu
    MENU.map { |dish, price| "#{dish}: £#{price}" }.join("\n")
  end
end
