require 'twilio-ruby'
require 'dotenv'

class Messaging
  Dotenv.load('twilio.env')
  FROM = ENV['SENDER_NUMBER'] # Your Twilio number
  TO = ENV['RECEIVER_NUMBER'] # Your mobile phone number
    

  def initialize(client = Twilio::REST::Client.new(ENV['SID'], ENV['TOKEN']))
    @client = client
  end
  
  def send(message)
    
    @client.messages.create(
      from: FROM,
      to: TO,
      body: message
      )

  end

end
