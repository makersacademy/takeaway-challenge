class Menu
  DISHES = {"Jalfrezi"=> 5.99,
            "Tikka"=> 4.99,
            "Balti"=> 5.49,
            "Butter Chicken"=> 12,
            "Naan"=> 1}.freeze

  attr_reader :dishes
  def initialize
    @dishes = DISHES
  end

  def price(dish)
    dishes[dish]
  end
end
