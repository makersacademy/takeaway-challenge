require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Confirmation

  def initialize
    @to = ENV['TO_PHONE_NUMBER']
    from = ENV['TWILIO_PHONE_NUMBER']
  end

  def send
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    client.messages.create(
      from: from,
      to: @to,
      body: "Thank you for your order"  
    )
  end

end
