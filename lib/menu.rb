class Menu
  attr_reader :menu, :prices

  def initialize
    @prices = {
      "Curry Goat w/ Rice & Peas" => 7.99,
      "Oxtail Stew w/ White Rice" => 8.49,
      "Barrel Grilled Whole Jerk Chicken" => 12.99,
      "Trinidad Special Roast Snapper" => 7.59,
      "Traditional Lamb Patty" => 3.99,
      "Salted Cassava Chips" => 2.99,
      "Mango, Banana, Lime & Rum Drink" => 4.59
      }

    @menu = {
      1 => "Curry Goat w/ Rice & Peas",
      2 => "Oxtail Stew w/ White Rice",
      3 => "Barrel Grilled Whole Jerk Chicken",
      4 => "Trinidad Special Roast Snapper",
      5 => "Traditional Lamb Patty",
      6 => "Salted Cassava Chips",
      7 => "Mango, Banana, Lime & Rum Drink"
    }
  end

end
