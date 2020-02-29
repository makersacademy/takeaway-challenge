class Customer

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def show_menu
    @menu.display
  end

  def show_order
    @order.display
  end

end
