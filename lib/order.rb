class Order
  attr_reader :order_items, :order_total_price, :delivery_address, :contact_phone
  def initialize(order_items, order_total_price,
                 delivery_address, contact_phone, message_sender)
    @order_items = order_items
    @order_total_price = order_total_price
    @delivery_address = delivery_address
    @contact_phone = contact_phone
    @message_sender = message_sender
  end

  def summary
    self
  end

  def delivery_time
    (Time.now + 3600).strftime("%F:%H:%M:%S")
  end

  def confirm
    @message_sender.send_message(contact_phone, delivery_time)
  end

end
