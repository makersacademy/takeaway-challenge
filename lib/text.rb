# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

class Text
  def initialize(twilio = Twilio::REST::Client)
    @twilio = twilio
    account_sid = 'AC0c93e71e606c42a272f499198205d918'
    auth_token = '05ed1b70990671dfd83f7e403652d1fb'
    @client = @twilio.new(account_sid, auth_token)

    @from = '+18302158981' # Your Twilio number
    @to = '+447745100951' # Your mobile phone number
  end

  def send_message
    @client.messages.create(
      from: @from,
      to: @to,
      body: "Thank you! Your order was placed and will be delivered before #{(Time.now + 60*60).strftime "%H:%M"}"
    )
    true
  end
end
