# Holds food items with prices
class Menu
  attr_reader :dishes

  FOOD_MENU =
    { 'Chicken korma' => 5.50, 'Offal surprise' => 6.99,
      'Soggy chips' => 3.99, 'Microwaved wrap' => 4.50,
      'Lamb vindaloo' => 6.95, 'Mystery stew' => 5.99,
      'Greasy salad' => 2.99, 'Questionable sauce' => 0.99,
      'Hangover curry' => 7.99, 'Cleanout special' => 1.99 }.freeze

  def initialize
    @dishes = FOOD_MENU
  end
end
