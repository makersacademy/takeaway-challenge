class Order
  require File.dirname(__FILE__) + '/defaults'
  require File.dirname(__FILE__) + '/twilio_intergration'
  require File.dirname(__FILE__) + '/receipt'
  require File.dirname(__FILE__) + '/hidden'

  attr_reader :basket

  @@order_id = 0

  def initialize(basket = Basket.new, time = Time.new, sms_interface = TwilioIntergration)
    @order_time = time
    @basket = basket
    @sms_interface = sms_interface
    @@order_id += 1
  end

  def finalise_order(sms = true, phone_number = Hidden::RECEIVERS_PHONE )
    send_sms(Defaults::DEFAULT_MESSAGE, order_time, phone_number) if sms
    create_receipt
  end

  def to_s
    "Order ID: #{@@order_id} - Total: #{Defaults::DEFAULT_CURENCY}#{basket.calculate_total}"
  end

  private
  def send_sms(message, time, phone_number)
    sms_interface.send_sms(message.concat("#{(time + Defaults::DELIVERY_TIME).strftime('%H:%M')}"), phone_number)
  end

  def create_receipt
    Receipt.new(self)
  end

  attr_reader :order_time, :sms_interface
end
