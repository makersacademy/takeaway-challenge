class Takeaway

  DEFAULT_DISHES = {
    "Pizza" => Dish.new('Pizza', 1.50),
    "Sushi" => Dish.new('Sushi', 16.00)
  }

  def initialize(dishes = DEFAULT_DISHES, order_class = Order, menu_class = Menu, order_handler_class = OrderHandler)
    @menu = menu_class.new(dishes)
    @order_handler = order_handler_class.new(@menu, order_class)
  end

  def dishes
    @menu.list
  end

  def order(string, amount)
    @order_handler.handle_order(string, amount)
  end

end