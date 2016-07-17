require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class TextService

  def initialize
    api_sid = ENV.fetch('TWILIO_ACCOUNT_SID')
    api_auth = ENV.fetch('TWILIO_ACCOUNT_AUTH')

    @client = Twilio::REST::Client.new(
      api_sid, api_auth,)
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
