#Understands dishes and prices

class Menu

  attr_reader :dishes

  def initialize
    @dishes = {
      "Burger" => 2.50,
      "Wings" => 3.00,
      "Meal" => 4.00,
      "Shake" => 2.50
      }
  end

  def dish_on_menu(dish)
    fail "Not on menu" unless dishes.has_key?(dish)
  end

  def price(dish)
    dishes[dish]
  end

end
