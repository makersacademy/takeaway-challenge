class Takeaway
  MENU = {
    "Quarter Chicken" => 4,
    "Half Chicken" => 8,
    "Whole Chicken" => 13,
    "Chicken Wing" => 1
  }

  def menu
    MENU.map { |dish, price| "#{dish}: £#{price}" }.join("\n")
  end
end
