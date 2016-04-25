class Menu
  attr_reader :menu
  def initialize
    @menu = {"Fried Rice" => 5.99, "Chicken Chow Mein" => 7.99, "Cheeseburger" => 6.99, "Pizza" => 8.99}
  end
  def display_menu
    @menu
  end
end
