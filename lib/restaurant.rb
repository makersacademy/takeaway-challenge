require "./lib/menu.rb"
require "./lib/order.rb"

class Restaurant
  attr_reader :order, :basket

  def initialize(order = Order.new)
    @order = order
    @basket = []

  end

  def display_menu(menu = Menu.new)
    menu.show_menu
  end

  def add_to_basket(dish)
    @basket = order.add(dish)
  end

  def display_basket
    @basket
  end
end
