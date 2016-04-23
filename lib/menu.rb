class Menu
  attr_reader :menu
  def initialize
    @menu = {"Fried Rice" => 5, "Chicken Chow Mein" => 7, "Cheeseburger" => 6, "Pizza" => 8}
  end
  def display_menu
    @menu
  end
end
