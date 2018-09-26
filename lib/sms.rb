# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'dotenv'
require 'twilio-ruby'

Dotenv.load 'config.env'

class SMS
  def initialize(sms_service = nil)
    @client = sms_service || Twilio::REST::Client.new(
      DEFAULT_CONFIG[:account_sid], 
      DEFAULT_CONFIG[:auth_token]
    )
  end

  def send(
      message = 'Hey, there!', 
      to = DEFAULT_CONFIG[:to], 
      from = DEFAULT_CONFIG[:from]
    )
    client.messages.create(
      from: from,
      to: to,
      body: message
    )
  end
  
  private

  attr_reader :client

  DEFAULT_CONFIG = {
    account_sid:  ENV['TWILIO_ACCOUNT_SID'],
    auth_token:   ENV['TWILIO_AUTH_TOKEN'],
    from:         ENV['FROM_PHONE_NUMBER'],
    to:           ENV['TO_PHONE_NUMBER']
  }

end
