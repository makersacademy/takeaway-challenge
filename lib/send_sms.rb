require 'rubygems'
require 'twilio-ruby'
require 'dotenv/load'

class SendSms
  attr_reader :message
  def initialize
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    client = Twilio::REST::Client.new(account_sid, auth_token)
    from = ENV["TWILIO_PHONE_NUM"]
    to = ENV["MY_PHONE_NUM"]
    one_hour_from_now = DateTime.now + (1 / 24.0)
    one_hour_from_now = one_hour_from_now.hour.to_s + ":" +
      one_hour_from_now.min.to_s
    @message = "Thank you! Your order was placed and will be delivered before #{one_hour_from_now}"
    client.messages.create(
    from: from,
    to: to,
    body: @message
    )
  end
end
