class Menu

  attr_reader :dishes

  def initialize
    @dishes = {"Chicken Wing" => 1.99, "Pizza" => 10.99, "Burger" => 4.99, "Soft Drink" => 1.49, "Ice Cream" => 2.99}
  end

  def read_menu
    return dishes
  end
end
