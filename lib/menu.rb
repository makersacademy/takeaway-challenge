require_relative "dish"

class Menu

  attr_reader :current_menu
  DISHES = {
            "Egg Fried Rice" => 2.20,
            "Singapore Noodles" => 3.30,
            "Salt and Spicy Bean Curd" => 4.40
            }

  def initialize(dishes = DISHES)
    @current_menu = dishes
  end

  # def add_to_menu(name = "Egg Fried Rice", price = 2.20))
  #   # fail "Dish already on menu" if dish_on_menu?(dish)
  #   dish = Dish.new(name, price)
  #   menu_item = {name: dish.name, price: dish.price}
  #   @items << menu_item unless dish_on_menu?(dish)
  # end

  # def dish_on_menu?(dish)
  #   @items.include?(dish)
  # end

end
