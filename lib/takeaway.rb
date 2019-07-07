class Takeaway
  def initialize(menu, order_handler)
    @menu = menu
    @order = order_handler
  end

  def add_to_menu(dish)
    @menu.add_to_menu(dish)
  end

  def menu_list
    @menu.list
  end

  def order_dish(number)
    @order.add_to_basket(@menu.dishes[number - 1])
  end

  def list_order
    order.basket
  end

  def remove_from_order(number)
    @order.remove_from_basket(number)
  end

  def total
    @order.total
  end

  def complete_order

  end
end
