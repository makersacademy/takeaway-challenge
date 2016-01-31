require 'dotenv'
require 'twilio-ruby'
Dotenv.load

class SmsHandler

  def initialize
    @client = Twilio::REST::Client.new(ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN'])
  end

  def send_sms(message)
    # delivery_time = (Time.now + 3600).strftime("%I:%M%p")
    @client.messages.create(
      from: ENV['FROM_PHONE'],
      to: ENV['TO_PHONE'],
      body: message
    )
  end
end
