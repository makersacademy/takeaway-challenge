require 'twilio-ruby'
require 'date'

class TwilioSMS
  DELIVERY_TIME = 1

  attr_reader :delivery_time

  def initialize(account_sid = ENV["TWILIO_ACCOUNT_SID"], auth_token = ENV["TWILIO_AUTH_TOKEN"])
    @account_sid = account_sid
    @auth_token = auth_token

    @delivery_time = Time.now.strftime("%H:%M").split(":")
    @delivery_time[0] = @delivery_time[0].to_i
    @delivery_time[0] += DELIVERY_TIME
    @delivery_time[0] = @delivery_time[0].to_s
    @delivery_time = @delivery_time.join(":")
  end

  def send_sms(from = ENV["TWILIO_MOBILE"])
    client = Twilio::REST::Client.new(@account_sid, @auth_token)

    to = ENV["PERSONAL_MOBILE"]

    client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered before #{@delivery_time}"
    )
  end

end
