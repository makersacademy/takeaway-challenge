require_relative 'menu'
require_relative 'order'

class Restaurant
  def initialize(menu_instance: menu, order_klass: Order)
    @menu = menu_instance
    @order_klass = order_klass
    create_order
  end

  def view_menu
    @menu.dishes
  end

  def order_add(dish_name, quantity = 1)
    create_order unless @order
    @order.add(dish_name, quantity)
  end

  def order_remove(dish_name)
    @order.remove(dish_name)
  end

  def view_order
    @order.view
  end

  def order_summary
    @order.summary
  end

  def checkout(amount)
    @order.complete(amount)
    create_order
  end

  private

  def create_order
    @order = @order_klass.new(menu: @menu)
  end
end
