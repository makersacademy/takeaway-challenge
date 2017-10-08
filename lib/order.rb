class Order
  require File.dirname(__FILE__) + '/defaults'
  require File.dirname(__FILE__) + '/twilio_intergration'
  require File.dirname(__FILE__) + '/receipt'
  attr_reader :basket
  def initialize(basket = Basket.new, time = Time.new, sms_interface = TwilioIntergration)
    @order_time = time
    @basket = basket
    @sms_interface = sms_interface
  end

  def finalise_order(sms = true)
    send_sms(Defaults::DEFAULT_MESSAGE, order_time) if sms
    create_receipt
  end

  def to_s
    "Order ID: #{object_id} - Total: #{Defaults::DEFAULT_CURENCY}#{basket.calculate_total}"
  end

  private
  def send_sms(message, time)
    sms_interface.send_sms(message.concat("#{(time + Defaults::DELIVERY_TIME).strftime('%H:%M')}"))
  end

  def create_receipt
    Receipt.new(self)
  end

  attr_reader :order_time, :sms_interface
end
