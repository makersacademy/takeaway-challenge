# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'
require 'dotenv'
Dotenv.load('constants.env')
# require './twilio-env-variable.env'

class Message

  def initialize
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @sender = ENV['SENDER'] # Your Twilio number
    @receiver = ENV['RECEIVER'] # Your mobile phone number
  end

  def send
    @client.messages.create(
    from: @sender,
    to: @receiver,
    body: "Thank you! Your order was placed and will be delivered before 18:52"
    )   
  end
end
