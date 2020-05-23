require_relative 'menu'
require_relative 'order'

class Resturant

  attr_reader :dishes, :order, :menu

  def initialize(menu_class = Menu)
    @menu = menu_class.new
  end

  def view_menu
    menu.show_menu
  end

  def start_order(order_class = Order)
    @order = order_class.new(@menu)
  end

  def cancel_order
    @order = nil
  end

  def add_to_order(dish, quantity)
    fail "order not started" if !order

    @order.add(dish, quantity)
  end

  def remove_from_order(dish, quantity = 1)
    @order.remove(dish, quantity)
  end

end
