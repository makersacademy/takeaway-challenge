class Takeaway
  attr_reader :menu_class, :order_class, :current_order
  def initialize(order_class = Order, menu_class = Menu, send_message_class = SendMessage)
    @menu_class = menu_class.new
    @order_class = order_class.new
    @send_message_class = send_message_class.new
  end

  def display_menu
    menu_class.list_menu
  end

  def ordered_items(item_chosen, quantity)
    @order_class.select_dishes(item_chosen, quantity)
  end

  def send_text_message
    @send_message_class.send_customer_message
  end

  def place_order(expected_price)
    raise "Order incomplete" if is_correct_price?(expected_price) == false
    send_text_message
    puts "Order complete, see you soon!"
  end

  def cost_of_order
    @order_class.price
  end

  def is_correct_price?(expected_price)
    cost_of_order == expected_price
  end

end