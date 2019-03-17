require 'twilio-ruby'
require 'dotenv'

class Messaging
  def initialize
    Dotenv.load('twilio.env')
    account_sid = ENV['SID']
    auth_token = ENV['TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end
  
  def send(message)
    from = ENV['SENDER_NUMBER'] # Your Twilio number
    to = ENV['RECEIVER_NUMBER'] # Your mobile phone number

    @client.messages.create(
    from: from,
    to: to,
    body: "#{message}"
    )

    puts "Order succesfully submitted"
  end

end
