class Menu

  attr_reader :dishes

  def initialize
    @dishes = { "chicken katsu" => 3.50,
                "beef udon" => 4.00,
                "crispy fish" => 5.50,
                "miso soup" => 1.50 }
  end

  def pricelist
    dishes.each { |dish, price| "#{dish}: £#{price}0" }
  end

  def dish_available?(dish)
    fail "Sorry! That dish is not on the menu." unless dishes.key?(dish)
    true
  end

end
