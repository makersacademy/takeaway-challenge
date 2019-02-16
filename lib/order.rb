class Order
  attr_reader :order_items, :order_total_price, :delivery_address, :contact_phone
  def initialize(order_items, order_total_price, delivery_address, contact_phone)
    @order_items = order_items
    @order_total_price = order_total_price
    @delivery_address = delivery_address
    @contact_phone = contact_phone
  end
end
