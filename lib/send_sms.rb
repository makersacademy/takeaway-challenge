# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'
require 'dotenv/load'

class SmsSender
  ACCOUNT_SID = ENV['TWILIO_ACCOUNT_SID']
  AUTH_TOKEN = ENV['TWILIO_AUTH_TOKEN']
  FROM = ENV['TWILIO_PHONE_NUMBER']
  TO = ENV['MY_PHONE_NUMBER']

  def initialize
    @client = Twilio::REST::Client.new(ACCOUNT_SID, AUTH_TOKEN)
  end

  def send_sms
    time = Time.new
    @client.messages.create(
      from: FROM,
      to: TO,
      body: "Thank you! Your order was placed and will be delivered before #{time.hour + 1}:#{time.min}"
    ) 
  end

end
