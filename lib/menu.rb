require_relative 'dish'
class Menu
  attr_reader :menu_list
  def initialize (menu_list=Hash.new)
    @menu_list = menu_list
  end
  def see_menu
    fail 'Menu is empty' if menu_list.empty?
    menu_list
  end
  def add_dish(dish)
    message = "#{dish.name} is already in the menu!"
    fail message if menu_list[dish.name]
    menu_list[dish.name] = dish.price
  end
  def remove_dish(dish)
    message = "#{dish.name} is not in the menu!"
    fail message unless menu_list[dish.name]
    menu_list.delete(dish.name)
  end

end