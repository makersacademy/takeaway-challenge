class Menu
  MENU = {
    'Avocado Maki' => 6,
    'Beef Teriyaki' => 10,
    'California Temaki' => 5,
    'Chicken Katsu Curry' => 11,
    'Duck Gyoza' => 4,
    'Dynamite Roll' => 7,
    'Edamame Beans' => 3,
    'Tuna Sashimi' => 7,
    'Salmon Nigiri' => 6,
    'Spicy Pepper Squid' => 7
  }.freeze

  attr_accessor :menu

  def initialize
    @menu = MENU
  end

end
