class Ristorante
  attr_reader :current_order

  MENU_LIST = {1=>[:egg_fried_rice, 3],
               2=>[:chicken_legs, 2],
               3=>[:miso_soup, 3],
               4=>[:egg_fried_miso_soup, 5],
               5=>[:pasta, 1],
               6=>[:garlic_bread, 1.5]}

  def menu
    @menu = MENU_LIST
  end

  def place_order(number, quantity)
    dish = menu[number][0]
    price = menu[number][1] * quantity
    set_current_order(dish, price)
  end

  def set_current_order(dish, price)
    @current_order << dish
    @current_order << price
  end

end
