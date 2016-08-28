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

end
