require "twilio-ruby"

class SendText

  attr_reader :customers

  def confirmation_text
    sender
  end

  private

    def sender

account_sid = 'AC7065cbcdbb0e6ee7c3cc826a5266fae6'
auth_token = '881c7342ab75ff58ebfe692d8499353f'

@client = Twilio::REST::Client.new account_sid, auth_token

# alternatively, you can preconfigure the client like so
Twilio.configure do |config|
  config.account_sid = account_sid
  config.auth_token = auth_token
end

# and then you can create a new client without parameters
@client = Twilio::REST::Client.new

@client.messages.create(
  from: '+441445295013',
  to: '+447921723500',
  body: 'Thank you! Your order was placed and will be delivered before #{(Time.now + 2700).strftime("%I:%M%p")}'
)
end
end
