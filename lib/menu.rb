require_relative './dish'
require_relative './printer'
require_relative './order'

# This is a menu, it is populated with dishes.
class Menu
  attr_reader :dishes

  def initialize
    @dishes = []
    @printer = Printer.new
  end

  def add_dishes(*dishes)
    dishes.each { |dish| @dishes << dish }
  end

  def remove_dishes(*dishes)
    dishes.each { |dish| @dishes.delete(dish) }
  end

  def view_menu
    @printer.print(self)
  end

  def place_order()
    order = Order.new

  end
end

dish_1 = Dish.new('Kung Pao Chicken', 'George likes his chicken spicy!', 8)
dish_2 = Dish.new('Pretzels', 'These pretzels are making me thirsty!', 2)
dish_3 = Dish.new('Soup', 'No soup for you!', 4)
dish_4 = Dish.new('Muffin Top', 'Top of the muffin to you!', 1.5)
dish_5 = Dish.new('Big Salad', 'Big lettuce, big carrots, tomatoes like volleyballs!', 6)
dish_6 = Dish.new('Calzone', 'Cheese, pepperoni, eggplant!', 3.5)

menu = Menu.new
menu.add_dishes(dish_1, dish_2, dish_3, dish_4, dish_5, dish_6)
menu.view_menu
