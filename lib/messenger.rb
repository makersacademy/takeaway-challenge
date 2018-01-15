require "twilio-ruby"
require "dotenv/load"


class Messenger

def initialize(sid = ENV['DB_ACOUNT'], token = ENV["DB_TOKEN"], 
               sender = ENV["DB_SEND"], time = Time)
   @client = Twilio::REST::Client.new(sid, token)
   @sender = sender
   @time = time
  end
 

def confirmation
	deadline = deadline
	message =  "Thank you! Your order will be delivered by #{deadline}"
 @client.messages.create(
    body: "hey did this message work 2?",
    to: ENV["DB_NUMBER"],
    from: @sender
  )
 end

 private

   def deadline
    deadline = @time.now + 1 * 60 * 60
    hour = time_format(deadline.hour)
    minutes = time_format(deadline.min)   
    "#{hour}:#{minutes}"
   end

   def time_format(time)
      "#{time}".length == 1  ?  "0#{time}" : "#{time}"   
   end

end
