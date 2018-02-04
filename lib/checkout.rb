require_relative './twiliosendsms.rb'

class Checkout

  def initialize(order_total, phone_number, sms_service = TwilioSendSMS)
    @order_total = order_total
    @phone_number = phone_number
    @sms_service = sms_service
  end

  def send_sms
    @sms_service.send_sms(@phone_number, sms_body)
  end

  private

  def sms_body
    "Thank you for your order. "\
    "It will be delivered at #{Time.now.strftime "%H:%M"}"
  end

end
