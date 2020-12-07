# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

class Text
  def initialize(twilio = Twilio::REST::Client)
    @twilio = twilio
    account_sid = '#################'
    auth_token = '####################'
    @client = @twilio.new(account_sid, auth_token)

    @from = '#########' # Your Twilio number
    @to = '#########' # Your mobile phone number
  end

  def send_message
    @client.messages.create(
      from: @from,
      to: @to,
      body: "Thank you! Your order was placed and will be delivered before #{(Time.now + 60 * 60).strftime "%H:%M"}"
    )
    true
  end
end
