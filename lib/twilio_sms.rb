require 'dotenv/load'
require 'twilio-ruby'

class TwilioSMS
  def initialize
    @account_sid = ENV['TWILIO_ACCOUNT_SID']
    @auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    @from = ENV['TWILIO_PHONE_NUMBER']
  end

  def message(to, body)
    send(to, body) unless @account_sid == "void"
  end

  private

  def send(to, body)
    @client.messages.create(
    from: @from,
    to: to,
    body: body
    )
  end
end
