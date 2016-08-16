class Menu
  attr_reader :dishes

  def initialize
    @dishes = {
      "Beef"    => 5.00,
      "Chicken" => 4.50,
      "Veg"     => 3.50
    }
  end
end
