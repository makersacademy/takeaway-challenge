class Restaurant

  attr_reader :menu, :order

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def view_menu
    @menu.print_menu
  end

  def select_dish(dish, qty)
    @order.add_to_basket(dish, qty)
  end

  def amend_basket(dish, qty)
    @order.remove_from_basket(dish, qty)
  end

  def view_basket
    @order.basket_total
  end
end
