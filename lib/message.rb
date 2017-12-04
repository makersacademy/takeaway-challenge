require_relative "./order.rb"

class Message

DELIVERY_TIME = 3600

attr_reader :order_timestamp, :delivery_time

def initialize(order_timestamp)
  @order_timestamp = order_timestamp
  @delivery_time = order_timestamp + DELIVERY_TIME

end

end
