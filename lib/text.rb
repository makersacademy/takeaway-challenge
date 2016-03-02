require 'twilio-ruby'
require 'dotenv'

Dotenv.load

class Text

  attr_reader :send_message

  def initialize
    @account_sid = ENV['ACCOUNT_SID']
    @auth_token = ENV['AUTH_TOKEN']
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
