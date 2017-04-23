# Holds food items with prices
class Menu
  attr_reader :dishes

  FOOD_MENU =
    { 'Chicken korma' => 5.99, 'Offal surprise' => 6.99,
      'Soggy chips' => 3.99, 'Microwaved wrap' => 4.99,
      'Lamb vindaloo' => 6.99, 'Mystery stew' => 5.99,
      'Greasy salad' => 2.99, 'Questionable sauce' => 0.89,
      'Hangover special' => 7.99, 'Cleanout curry' => 1.99 }.freeze

  def initialize
    @dishes = FOOD_MENU
  end

  def include?(item)
    dishes.include?(item)
  end
end
