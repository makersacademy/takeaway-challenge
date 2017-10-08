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
      body: "Thank you! Your food will be with you shortly."
    )
    puts "Message sent."
  end
end
