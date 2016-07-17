require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class TextService

  def initialize
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_ACCOUNT_AUTH']

    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_sms(message)
    client.messages.create(
      from: ENV['TWILIO_FROM_NUM'],
      to: ENV['TWILIO_TO_NUM'],
      body: message
    )

  end

  private

  attr_reader :client

end
