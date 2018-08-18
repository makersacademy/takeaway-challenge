class Order
  def initialize(menu = Menu.new)
    @menu = menu
  end

  def see_menu
    @menu.print_menu
  end

  def place_order(order_array)
    check_order(order_array)
    #send_text
  end

  private

  def check_order(order_array)
    given_total = order_array[1]
    checked_total = @menu.check_order(order_array[0])
    checked_total == given_total ? given_total : (raise "Incorrect order total provided!")
  end

  def send_text
    
  end
end
