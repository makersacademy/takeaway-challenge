require_relative 'menu.rb'
require_relative 'messenger.rb'
require_relative 'order.rb'
require_relative 'dish.rb'

class Restaurant
  def initialize(
    menu_class: Menu, 
    order_class: Order, 
    messenger_class: Messenger,
    dish_class: Dish
  )

    @order_class = order_class
    @messenger = messenger_class.new
    @menu = menu_class.new(dish_class: dish_class)
  end

  def view_menu
    @menu.display_menu
  end

  def create_order
    @order_class.new(menu: @menu, messenger: @messenger)
  end
end
