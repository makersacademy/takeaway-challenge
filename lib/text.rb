require "twilio-ruby"
require "dotenv"

class Text
TIME = "%H:%M"

Dotenv.load

attr_reader :client

  def initialize(client: nil)
    @client = client || Twilio::REST::Client.new(accound_sid, auth_token)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token  = ENV['TWILIO_AUTH_TOKEN']
  end

  def deliver
    client.messages.create(messages)
  end

  def messages
    {
    from:  ENV['TWILIO_NUM'],
    to:    ENV['MY_NUM'],
    body:  "Thank you! Your order was placed and will be delivered before #{time_deliver}"
    }
  end

  def time_deliver
    (Time.now + 60 + 60).strftime(TIME)
  end

end
