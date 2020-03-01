require 'twilio-ruby'
require 'dotenv/load'

class Message

  TIME_FORMAT = "%H:%M"

  attr_reader :client, :account_sid, :auth_token, :from, :to


  def initialize()
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = client || Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send
    from = ENV['TWILIO_NUMBER'] # Your Twilio number
    to = ENV['MY_NUMBER'] # Your mobile phone number
    @client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered before #{estimated_delivery_time}"
    )
  end

  def estimated_delivery_time
    (Time.now + 60 * 60).strftime(TIME_FORMAT)
  end
end
