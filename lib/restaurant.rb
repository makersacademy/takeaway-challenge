
require_relative './menu'
require_relative './printer'
require_relative './dish'
require_relative './order'
require_relative './messenger'
require_relative './errors'

# This is the main interface, representing a takeaway restaurant.
class Restaurant
  attr_reader :name

  def initialize(name = "Monk's")
    @name = name
    @menu = Menu.new
    @order_counter = 0
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
    raise(MenuError) if menu_number > @menu.dishes.count || menu_number < 1
    @order ||= Order.new
    @order_counter += 1 if @order.basket.empty?
    dish = @menu.dishes[menu_number - 1]
    @order.add_to_basket(dish, quantity)
  end

  def view_basket
    return 'Your basket is empty!' if @order.nil?
    @order.show_basket
  end

  def checkout(expected_order_total)
    @order.finalise(expected_order_total, @order_counter)
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
monks.order(1, 2)
monks.checkout(16)