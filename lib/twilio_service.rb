require 'dotenv/load'
require 'twilio-ruby'

class TwilioService
  attr_reader :client, :twilio_number

  def initialize
    account_sid = ENV["ACCOUNT_SID"]
    auth_token = ENV["AUTH_TOKEN"]
    @twilio_number = ENV["TWILIO_NUMBER"]
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_sms(recipient, body)
    @client.api.account.messages.create(
        from: @twilio_number,
        to: recipient,
        body: body
    )
  end

end
