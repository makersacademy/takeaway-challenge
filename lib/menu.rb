class Menu
  attr_reader :food
  DEFAULT = {
    "Hamburger" => 2.50,
    "Cheeseburger" => 3.50,
    "Double Cheeseburger" => 4.50,
    "Bacon Cheeseburger" => 4.00,
    "Double Bacon Cheeseburger" => 5
  }

  def initialize(food = DEFAULT)
    @food = food
  end

  def view_menu
    @food.map { |item, price|"#{item} --- £#{price}" }.join("\n")
  end
end
