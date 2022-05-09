class Takeaway

  def initialize(menu_instance, order_instance)
    @menu_instance = menu_instance
    @order_instance = order_instance
  end

  def print_menu
    @menu_instance.print_menu
  end

  def order(number)
    @order_instance.take_order(number)
  end
end
