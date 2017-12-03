class Menu

  attr_accessor :the_menu

  def initialize
    @the_menu = {
      "chicken" => 5,
      "chips" => 2,
      "peas" => 1,
      "cod" => 6
    }
  end

  def add_to_menu(food, price)
    @the_menu[food] = price
  end

end
