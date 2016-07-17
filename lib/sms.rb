require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class SMS

  def initialize
    @account_sid = ENV['TWILIO_ACCOUNT_SID']
    @auth_token = ENV['TWILIO_AUTH_TOKEN']
  end

  def delivery_message
    @client = ::Twilio::REST::Client.new(ENV['TWILIO_AUTH_TOKEN'], ENV['TWILIO_ACCOUNT_SID'])
    @client.messages.create(
      from: ENV['TWILIO_TO_NUMBER'],
      to: ENV['TWILIO_FROM_NUMBER'],
      body: "Your order of has been received and should be with you before #{delivery_time}",
    )
  end

  def delivery_time(time = Time.now)
    (time.hour + 1).to_s + ":" + time.min.to_s
  end

private

  attr_reader :account_sid, :auth_token, :client

end
