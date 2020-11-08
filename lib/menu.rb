class Menu

  attr_reader :food

  def initialize
    @food = {
      "Hamburger" => 2.50,
      "Cheeseburger" => 3.50,
      "Double Cheeseburger" => 4.50,
      "Bacon Cheeseburger" => 4.00,
      "Double Bacon Cheeseburger" => 5
    }
  end

  def view_menu
    @food.map { |item, price| "#{item} --- £#{price}" }.join(', ')
  end
end
