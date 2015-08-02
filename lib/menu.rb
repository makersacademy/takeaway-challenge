class Menu
  MENU = {
    "Deer Fur" => 5.00,
    "Fish Foot" => 5.50,
    "Capybara Tail" => 6.00,
    "Kangaroo Udder" => 7.00,
    "Dragon Tongue" => 8.50,
    "Man Bun" => 9.00,
    "Owl Feather's" => 10,
    "Fried Gecko" => 10.50,
    "Robust Rodney" => 15.00,
    "330ml Heineken" => 23.50
  }

  attr_accessor :meals

  def initialize(meals = MENU)
    @meals = meals
  end
end
