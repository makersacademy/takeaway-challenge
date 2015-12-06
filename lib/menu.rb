class Menu
  attr_reader :list

  def initialize
    @list = { "Dish 1" => 1.00,
              "Dish 2" => 2.00,
              "Dish 3" => 3.00 }
  end

end
