require_relative 'price_error'
require_relative 'delivery_sms'

class Price

  def initialize(sms = DeliverySMS.new)
    @sms = sms
  end

  def confirm(customer_input_price, order)
    raise PriceError unless customer_input_price == total_cost(order)
    @sms.send
  end

  def total_cost(order)
    total = 0
    order.each do |dish|
      total += dish[:quantity] * dish[:price]
    end
    total
  end
end
