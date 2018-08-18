class Order
  def initialize(menu = Menu.new)
    @menu = menu
  end

  def see_menu
    @menu.print_menu
  end

  def place_order(order_array)
    given_total = order_array[1]
    @menu.check_order(order_array[0])
  end
end
