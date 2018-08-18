require_relative 'menu'
require_relative 'order'

class Takeaway
  attr_reader :menu, :current_order

  def initialize(menu = Menu.new, order = Order.new)
    @current_order = order
    @menu = menu
  end

  def see_menu
    menu.show_menu
  end

  def order(dish, quantity)
    menu.order_dish(dish, quantity)
  end

end
