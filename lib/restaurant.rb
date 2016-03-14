class Restaurant
  def initialize(menu_klass: menu_class, order_klass: order_class)
    @menu = menu_klass.new
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

  def order_remove(dish_name, quantity = 1)
    @order.remove(dish_name, quantity)
  end

  def view_order
    @order.view
  end

  def order_summary
    @order.summary
  end

  def checkout
    @order.complete
    create_order
  end

  private

  def create_order
    @order = @order_klass.new @menu
  end
end
