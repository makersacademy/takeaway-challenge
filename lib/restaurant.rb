class Restaurant

  def initialize menu, order_class = Order
    @menu = menu
    @order_class = order_class
    @order = @order_class.new(@menu)
  end

  def view_menu
    @menu.view
  end

  def order dish, quantity
    @order.add(dish, quantity)
  end

end
