class Order_verifier

  def initialize(message_handler = Message_handler.new)
    @message_handler = message_handler
  end

  def process_order(order)
    raise "Order total does not match" if !check_total(order)
    place_order(order)
  end

  private

  def check_total(order)
    total = 0
    order.selected_dishes.each do |item|
      price = item[1]
      total += price * item[2]
    end
    total == order.total
  end

  def place_order(order)
    @message_handler.send_message(order)
  end

end
