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
    @client.api.account.messages.create(
      from: @from,
      to: @to,
      body: "Thank you! Your order was placed and will be delivered before #{time_one_hour_from_now}"
    )
    puts "Message sent."
  end

  private

  def time_one_hour_from_now
    seconds_in_hour = 3600
    t = Time.now
    t += seconds_in_hour
    t.strftime("%H:%M")
  end
end
