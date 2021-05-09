require 'twilio-ruby'
require 'dotenv'
Dotenv.load('twilio_keys.env')


class Sms
  account_sid = ENV["TWILIO_SID"]
  auth_token = ENV["TWILIO_AUTH_TOKEN"]

  def initialize(client=Twilio::REST::Client.new(account_sid, auth_token))
    @client = client 
  end

  def send
    from = ENV["TWILIO_PHONE_NUMBER"] # Your Twilio number
    to = ENV["MY_PHONE_NUMBER"] # Your mobile phone number
    @client.messages.create(
      from: from,
      to: to,
      body: "Hey friend!"
      )
  end
end