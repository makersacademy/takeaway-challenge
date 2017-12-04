require_relative "./order.rb"
require_relative "./secret_data.rb"
require "twilio-ruby"


class Message

DELIVERY_TIME = 3600

attr_reader :order_timestamp, :delivery_time

def initialize(order_timestamp)
  @order_timestamp = order_timestamp
  @delivery_time = order_timestamp + DELIVERY_TIME
end

def send_sms
  
end

end
