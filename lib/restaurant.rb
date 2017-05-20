
require_relative './menu'
require_relative './printer'

# This is the main interface, representing a takeaway restaurant.
class Restaurant

  def initialize
    @menu = Menu.new
  end

  def add_dish(name, description, price)
    @menu.add_dishes(Dish.new(name, description, price))
  end

  def remove_dish(menu_number)
    dish_to_remove = @menu.dishes[menu_number - 1]
    @menu.remove_dishes(dish_to_remove)
  end

  def view_menu
    @menu.show_menu
  end

  def order(menu_number, quantity)
    @order ||= Order.new
    @order.add_to_order(menu_number, quantity)
  end

  def finalise_order(expected_order_total)
    @order.finalise(expected_order_total)
  end

end

monks = Restaurant.new
monks.add_dish('Kung Pao Chicken', 'George likes his chicken spicy!', 8)
monks.add_dish('Big Salad', 'Big lettuce, big carrots, tomatoes like volleyballs!', 6)
monks.add_dish('Pretzels', 'These pretzels are making me thirsty!', 2)
monks.add_dish('Soup', 'No soup for you!', 4)
monks.add_dish('Calzone', 'Cheese, pepperoni, eggplant!', 3.5)
monks.add_dish('Muffin Top', 'Top of the muffin to you!', 1.5)
monks.view_menu
monks.order(1, 2)
