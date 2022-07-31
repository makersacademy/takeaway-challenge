require "dotenv"
Dotenv.load
require "twilio-ruby"

class Text
  
  def initialize(message,number = ENV["TO_NUMBER"])
    @client = Twilio::REST::Client.new(ENV["TWILIO_SID"],ENV["TWILIO_AUTH"])
    @client.messages.create(from:ENV["FROM_NUMBER"],to:number,body:message)
  end

end