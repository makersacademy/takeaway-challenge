require 'csv'

# Holds food items with prices
class Menu
  attr_reader :dishes

  def initialize
    @dishes = {
      'Rare chicken' => 5.99, 'Offal surprise' => 6.99,
      'Soggy chips' => 3.99, 'Sloppy burger' => 4.99,
      'Fungal fiesta' => 6.99, 'Mystery stew' => 5.99,
      'Greasy salad' => 2.99, 'Questionable sauce' => 0.89,
      'Hangover special' => 7.99, 'Cleanout curry' => 1.99
    }
  end

  def include?(item)
    dishes.include?(item)
  end
end
