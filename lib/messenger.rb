
require "twilio-ruby"

class Messenger

ACC_SID = ""
AUTH_TOKEN = ""

def initialize
  @client = Twilio::REST::Client.new(ACC_SID, AUTH_TOKEN)
end

def send_confirmation
  client.messages.create(
  from: "",
  to: "",
  body: confirmation_message)
end

private

attr_reader :client

def time
  (Time.now + 60*60).strftime("%H:%M")
end

def confirmation_message
  "Thanks for ordering. Your meal will be delivered at #{time}"
end

end
