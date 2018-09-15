class Menu
  attr_reader :current_menu

  def initialize
    @current_menu = {
      "pelmeni" => 6.99,
      "borscht" => 5.99,
      "tvarog" => 3.99,
      "olivier" => 4.99,
      "salat" => 1.99,
      "blinchiki" => 9.99
    }
  end

  def add_dish(dish, price)
    current_menu[dish] = price.to_f 
  end

end