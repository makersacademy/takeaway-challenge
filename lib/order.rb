require File.dirname(__FILE__) + '/twilio_integration'
require File.dirname(__FILE__) + '/receipt'

class Order
  DEFAULT_CURENCY = "£"
  DELIVERY_TIME = 60 * 60
  DEFAULT_MESSAGE = "Thank you! Your order was placed and will be delivered before "
  
  attr_reader :basket

  @@order_id = 0

  def initialize(basket = Basket.new, time = Time.new, sms_interface = TwilioIntegration)
    @order_time = time
    @basket = basket
    @sms_interface = sms_interface
    @@order_id += 1
  end

  def finalise_order(sms = true, phone_number = ENV["TWILIO_RECEIVERS_PHONE"] )
    send_sms(DEFAULT_MESSAGE, order_time, phone_number) if sms
    create_receipt
  end

  def to_s
    "Order ID: #{@@order_id} - Total: #{DEFAULT_CURENCY}#{basket.calculate_total}"
  end

  private
  def send_sms(message, time, phone_number)
    sms_interface.send_sms(message.concat("#{(time + DELIVERY_TIME).strftime('%H:%M')}"), phone_number)
  end

  def create_receipt
    Receipt.new(self)
  end

  attr_reader :order_time, :sms_interface
end
