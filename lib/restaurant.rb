class Restaurant

  attr_reader :menu, :order

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def view_menu
    menu.print_menu
  end

  def select_dish(dish, qty)
    order.add_to_order(dish, qty)
  end

end
