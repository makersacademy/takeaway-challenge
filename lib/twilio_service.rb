require 'twilio-ruby'

class TwilioService

  attr_reader :client

  def initialize(account_sid, auth_token, from_phone, client = nil)
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @client = client unless client.nil?
    @from = from_phone
  end

  def send_sms(to_phone, msg)
    @client.messages.create(
      from: @from,
      to: to_phone,
      body: msg
    )
  end
end
