require 'twilio-ruby'
require 'dotenv/load'

class Message

def initialize
  @client = Twilio::REST::Client.new(ENV['SID'], ENV['TOKEN'])
end

def send(message) 
  @client.messages.create(
    from: ENV['TWILIO_PHONE_NUMBER'],
    to: ENV['PHONE_NUMBER'],
    body: message
    )
end
end