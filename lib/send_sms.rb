require 'rubygems'
require 'twilio-ruby'
require_relative 'twilio_private_data'

class SendSms
  def initialize
    account_sid = TwilioPrivateData::SID
    auth_token = TwilioPrivateData::TOKEN
    @client = Twilio::REST::Client.new account_sid, auth_token
    @from = TwilioPrivateData::FROM
    @to = TwilioPrivateData::TO
  end

  def send
    msg = "Thank you! Your order was placed and will be delivered before #{eta}"
    @client.api.account.messages.create(
      from: @from,
      to: @to,
      body: msg
    )
    puts "Message sent."
  end

  private

  def eta
    seconds_in_hour = 3600
    t = Time.now
    t += seconds_in_hour
    t.strftime("%H:%M")
  end
end
