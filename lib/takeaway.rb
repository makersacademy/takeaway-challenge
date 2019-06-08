class Takeaway
  attr_reader :order_class, :send_message_class
  def initialize(order_class = Order, send_message_class = SendMessage)
    @order_class = order_class.new
    @send_message_class = send_message_class.new
  end

  def display_menu
    order_class.display_menu
  end

  def ordered_items(item_chosen, quantity)
    order_class.select_dishes(item_chosen, quantity)
  end

  def place_order(expected_price)
    raise "Order incomplete" if correct_price?(expected_price) == false
    send_text_message
  end

  private
  def send_text_message
    send_message_class.send_customer_message
  end
  
  def cost_of_order
    order_class.price
  end

  def correct_price?(expected_price)
    cost_of_order == expected_price
  end

end
