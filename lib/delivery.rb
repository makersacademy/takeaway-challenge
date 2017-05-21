# It is responsbile for holding information about the order delivery
require_relative 'order'

class Delivery

  attr_reader :delivery_time, :order_time
  DELIVERY_ESTIMATE = 60

  def initialize(order_time)
    @order_time = order_time
    @delivery_time = order_time + DELIVERY_ESTIMATE
  end

end
