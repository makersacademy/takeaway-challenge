class Confirmation
  def initialize(order_time = Time.now)
    @order_time = order_time
    @delivery_time = order_time + 3600
    @delivery_time_hour = @delivery_time.hour
    @delivery_time_minute = @delivery_time.min
  end
  def content
    "Thank you! Your order was placed and will be delivered before #{@delivery_time_hour}:#{@delivery_time_minute}"
  end
end