class Menu

MENU = { "Chicken" => 5.50, "Lamb" => 2.40, "Beef" => 3.60, "Fish" => 4.50 }.freeze

  def print_menu
    MENU.map { |item, price| "%s £%.2f" % [item.to_s.capitalize, price]}.join(", ")

  end

  def get_dish_price(dish)
    MENU[dish]
  end



end
