class Menu
  attr_reader :dishes
  def initialize
    @dishes = { "Burger" => 3,
              "Chips" => 2,
              "Drink" => 1 }
  end

  def show_menu
    dishes
  end

end
