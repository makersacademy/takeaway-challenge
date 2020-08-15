class Menu
  attr_reader :menu
  def initialize
    @menu = [{"chips": 2}, {"pizza": 12}, {"pasta": 8}, {"soup": 3}, {"salad": 3}, {"beer": 1}, {"water": 1}, {"ice cream": 2}, {"broccoli": 2}]
  end

  def find_in_menu(dish_name)
    @menu.find { |menu_dish| menu_dish.keys.join == dish_name }
  end

  def get_price(dish_name)
    fail "Sorry we don't have that this please check your order" if find_in_menu(dish_name) == nil
    find_in_menu(dish_name).values.join.to_i
  end

end