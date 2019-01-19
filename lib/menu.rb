require_relative 'dish'

class Menu

  attr_reader :menu_list

  def initialize
    @menu_list = {}
  end

  def add(dish_name, price, dish = Dish)
    @menu_list[dish.new(dish_name, price).dish_name] = price
  end

  def to_string
    menu_to_list = ""
    @menu_list.map { |dish_name, price|
      menu_to_list << "#{dish_name} at £#{sprintf('%.2f', price)}\n"
    }
    return menu_to_list
  end

end
