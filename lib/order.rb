class Order
  def initialize(menu = Menu.new, send_text = SendText.new)
    @menu = menu
    @send_text = send_text
  end

  def see_menu
    @menu.print_menu
  end

  def place_order(order_array)
    @menu.check_order(order_array)
    @send_text.send
  end

end
