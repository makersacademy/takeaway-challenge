require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :order, :menu

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def display_menu
    @menu.dishes
  end

  def place_order(dish, quantity)
    @order.add_dish(dish, quantity)
  end

end
