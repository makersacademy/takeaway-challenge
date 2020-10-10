require_relative 'menu'
require_relative 'order'
class Takeaway 
  attr_reader :menu
  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def view_menu
    @menu.view_dishes
  end

  def add_to_order(dish, price, quantity)
    @order.add(dish, price, quantity)
  end
end
