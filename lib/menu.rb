class Menu
  attr_reader :menu_list

  def initialize
    @menu_list = {
      pizza: 8,
      cheese_burger: 7,
      beef_burger: 6.50,
      fish_n_chips: 4,
      chicken_wrap: 6,
      spaghetti_bolognese: 7.50
    }
  end
end
