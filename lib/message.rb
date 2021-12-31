require 'dotenv' #this is generating a loaderror if I try to run message.rb file
Dotenv.load('twilio.env')

require 'twilio-ruby' #this is generating a loaderror if I try to run message.rb file

class Message

  def initialize
    twilio_id = ENV['TWILIO_ID']
    twilio_token = ENV['TWILIO_TOKEN']
    @client = Twilio::REST::Client.new(twilio_id, twilio_token) 
  end  

  def send(total) 
    p arrival_time = (Time.now + 60*60).strftime("%H:%M")
    #order_cost = total
    total = '%.2f' % total
    @client.messages.create(
      from: ENV['TWILIO_NUM'],
      to: ENV['MY_NUM'],
      body: "Thank you for your order, which totals to £#{total}. Your food will arrive by #{arrival_time}"
      )
    "Thank you for your order, which totals to £#{total}. Your food will arrive by #{arrival_time}"
  end 
end

m = Message.new
p m.send("12")
#Not sure how to resolve the error generated when this method is called in irb. nb: I am using my twilio test credentials with Twilio magic number as the FROM and my verified mobile number as the TO. Error is /Users/katbrooks/.rvm/gems/ruby-3.0.2/gems/twilio-ruby-5.62.0/lib/twilio-ruby/framework/rest/version.rb:146:in `create': [HTTP 401] 20003 : Unable to create record (Twilio::REST::RestError)
    #Authenticate
    #https://www.twilio.com/docs/errors/20003