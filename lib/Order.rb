class Order

  attr_reader :order_items, :delivery_time

  TIME_TO_DELIVER = 60 * 60

  def initialize(order)
    @order_items = Array.new
    @order_time = Time.now
    interpret_order(order)
    verify_order
    @delivery_time = @order_time + TIME_TO_DELIVER
  end

  def interpret_order(order)

  end

  def verify_order

  end

end
