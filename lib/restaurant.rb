
require_relative './menu'
require_relative './printer'
require_relative './dish'
require_relative './order'
require_relative './messenger'

# This is the main interface, representing a takeaway restaurant.
class Restaurant
  attr_reader :name

  def initialize(name = "Monk's")
    @name = name
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

  def order(menu_number, quantity = 1)
    @order ||= Order.new
    dish = @menu.dishes[menu_number - 1]
    puts @order.add_to_basket(dish, quantity)
  end

  def view_basket
    @order.show_basket
  end

  def finalise_order(expected_order_total)
    @order.finalise(expected_order_total)
    @order = nil
  end

end

monks = Restaurant.new

monks.add_dish('Kung Pao Chicken', 'George likes his chicken spicy!', 8)
monks.add_dish('Big Salad', 'Big lettuce, big carrots, tomatoes like volleyballs!', 6)
monks.add_dish('Pretzels', 'These pretzels are making me thirsty!', 2)
monks.add_dish('Soup', 'No soup for you!', 4)
monks.add_dish('Calzone', 'Cheese, pepperoni, eggplant!', 3.5)
monks.add_dish('Muffin Top', 'Top of the muffin to you!', 1.5)
monks.add_dish('Junior Mints', "It's chocolate, it's peppermint, it's delicious!", 0.5)

monks.order(2, 1)
monks.order(1)
monks.order(2, 2)
monks.order(4)
monks.order(7, 4)
puts
monks.view_basket
