require 'dotenv'
require 'twilio-ruby'

class Text

  def initialize
    Dotenv.load
    @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end

  def send_message(message)
    @client.messages.create(
      from:  ENV['TWILIO_NUMBER'],
      to:    ENV['MY_NUMBER'],
      body:  message
    )
  end

end
