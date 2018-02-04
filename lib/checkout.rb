require_relative './twiliosendsms'

class Checkout

  def initialize(order_total, sms_service = TwilioSendSMS)
    @order_total = order_total
    @sms_service = sms_service
  end

  def pay(payment, phone_number)
    raise "Incorrect money provided" unless @order_total == payment
    send_sms(phone_number)
    "Thank you. Your order has been placed. You will receive confirmation by text message"
  end

  private

  def send_sms(phone_number)
    @sms_service.send_sms(phone_number)
  end

end
