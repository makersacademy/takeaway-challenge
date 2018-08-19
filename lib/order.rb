class Order
  def initialize(manage_order = OrderManager.new, send_text = SendText.new)
    @manage_order = manage_order
    @send_text = send_text
  end

  def see_menu
    @manage_order.print_menu
  end

  def place_order(order_array)
    @manage_order.check_order(order_array)
    #@send_text.send
  end

end
