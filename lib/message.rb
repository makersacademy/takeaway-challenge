require 'twilio-ruby'

class Message

def initialize
  @account_sid = ENV['SID']
  @auth_token = ENV['TOKEN']
  @client = Twilio::REST::Client.new(account_sid, auth_token)
end

def send(message) 
  @client.messages.create(
    from: ENV['TWILIO_PHONE_NUMBER'],
    to: ENV['PHONE_NUMBER'],
    body: message
    )
end
end