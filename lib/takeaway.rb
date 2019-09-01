require_relative './menu'
require_relative './order'
class Takeaway
  attr_reader :menu, :order
  def initialize(menu = Menu.new)
    @menu = menu
  end

  def view_menu
    @menu.display_menu
  end

  def order_food(dish, quantity = 1, order = Order.new)
    @order = order
    @order.select_dish(dish, quantity)
  end

end
