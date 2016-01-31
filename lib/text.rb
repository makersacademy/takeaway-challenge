require 'twilio-ruby'
require 'dotenv'

class Text

  def initialize
    @credentials = Dotenv.load
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def send_message(message)
    @client.messages.create(
    from: ENV['SENDING_NUMBER'],
    to: ENV['TEST_NUMBER'],
    body: message
    )
  end

end
