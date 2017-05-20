require_relative './dish'
require_relative './printer'

# This is a menu, it is populated with dishes.
class Menu
  attr_reader :dishes

  def initialize
    @dishes = []
    @printer = Printer.new
  end

  def add_dishes_to_menu(*dishes)
    dishes.each { |dish| @dishes << dish }
  end

  def remove_dish_from_menu(*dishes)
    dishes.each { |dish| @dishes.delete(dish) }
  end

  def view_menu
    @printer.print(self)
  end
end

dish1 = Dish.new('Kung Pao Chicken', 'George likes his chicken spicy!', 8)
dish2 = Dish.new('Pretzels', 'These pretzels are making me thirsty!', 2)
dish3 = Dish.new('Soup', 'No soup for you!', 4)
dish4 = Dish.new('Muffin Top', 'Top of the muffin to you!', 1.5)
dish5 = Dish.new('Big Salad', 'Big lettuce, big carrots, tomatoes like volleyballs!', 6)
dish6 = Dish.new('Calzone', 'Cheese, pepperoni, eggplant!', 3.5)

menu = Menu.new
menu.add_dishes_to_menu(dish1, dish2, dish3, dish4, dish5, dish6)
menu.view_menu
