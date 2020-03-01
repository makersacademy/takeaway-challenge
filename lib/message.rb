require 'twilio-ruby'
require 'dotenv/load'

class Message

# gives us the time format of hours and minutes
  TIME_FORMAT = "%H:%M"

  attr_reader :client, :account_sid, :auth_token, :from, :to

# holds the authentification information, brought in using dotenv
  def initialize()
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = client || Twilio::REST::Client.new(account_sid, auth_token)
  end

# creates and send a message - consider refactoring to separate methods later
  def send
    from = ENV['TWILIO_NUMBER'] # Your Twilio number
    to = ENV['MY_NUMBER'] # Your mobile phone number
    @client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered before #{estimated_delivery_time}"
    )
  end

# calculates the time in one hour and puts into our chosen time format
  def estimated_delivery_time
    (Time.now + 60 * 60).strftime(TIME_FORMAT)
  end
end
