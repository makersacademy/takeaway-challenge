require 'dotenv'
require 'twilio-ruby'

class Text

  def initialize
    Dotenv.load
  end

  def send_message(message)
    start_client

    @client.messages.create(
      from:  ENV['TWILIO_NUMBER'],
      to:    ENV['MY_NUMBER'],
      body:  message
    )
  end

  def start_client
    @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end
end
