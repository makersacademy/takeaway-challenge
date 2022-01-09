class Menu

  attr_reader :menu

  def initialize
    @menu = {}
  end

  def add_dish(dish_name, dish_price)
    @menu[dish_name] = dish_price
  end

  def dish_in_menu?(dish_name)
    return !@menu[dish_name].nil?
  end
end
