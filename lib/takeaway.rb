require_relative 'menu'
require_relative 'order'

class Takeaway

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def view_menu(restaurant)
    @menu.view_dishes(restaurant)
  end

  def order(dish, quantity = 1)
    @order.add_order(dish, quantity)
  end

  def view_basket
    @order.basket
  end

end
