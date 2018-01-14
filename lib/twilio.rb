require "twilio-ruby"
require "dotenv/load"


class Messenger

def initialize(sid = ENV['DB_ACOUNT'], token = ENV["DB_TOKEN"], 
               sender = ENV["DB_SEND"])
   
   @client = Twilio::REST::Client.new(sid, token)
   @sender = sender
  end
 

def confirmation
 @client.messages.create(
    body: "hey did this message work 2?",
    to: ENV["DB_NUMBER"],
    from: @sender
  )
 end

end
