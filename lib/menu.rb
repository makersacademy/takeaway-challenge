class Menu
  MENU = {
    "Beef Burger" => 7,
    "Double Cheese Burger" => 9,
    "Hamburger" => 7,
    "Fish Taco" => 6,
    "Hot Dog" => 5,
    "Chips" => 1.50,
  }
  attr_accessor :dishes

  def initialize
    @dishes = MENU
  end

  def see_menu
    @dishes.map { |dish, price| "#{dish} = £#{price}"}.join(', ')
  end

end
