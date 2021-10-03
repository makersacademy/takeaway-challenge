class SendSMS
  
  require 'twilio-ruby'

  attr_reader :delivery

  def initialize(delivery = Delivery.new.delivery_time)
    @delivery = delivery
  end
  
  def message
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = ENV['TWILIO_MOBILE'] # Twilio phone number
    to = ENV['MY_MOBILE']

    client.messages.create(
    from: from,
    to: to,
    body: "Thank you for your order. Your food will arrive at or before #{@delivery}."
    )
  end
end
