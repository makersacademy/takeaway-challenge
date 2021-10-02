require "bundler"
require "twilio-ruby"
Bundler.require



class Sender

  attr_reader :client


  def initialize
    @client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"])
  end 

  def send_text(text)
    twilio_text(text)
  end





private 

def twilio_text(text)

  message = @client.messages.create(
    to:ENV["MY_PHONE_NUMBER"],
    from: "+447897017954", 
    body: text
)
end 

end 

  

