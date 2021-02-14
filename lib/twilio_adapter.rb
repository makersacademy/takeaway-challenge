require 'twilio-ruby'

class TwilioAdapter

  def initialize
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_message(customer_number, body)
    @client.messages.create(
      from: ENV['TWILIO_PHONE_NUMBER'],
      to: customer_number,
      body: body
    )
  end

end
