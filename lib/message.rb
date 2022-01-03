require 'dotenv' #this is generating a loaderror if I try to run message.rb file
Dotenv.load('twilio.env')

require 'twilio-ruby' #this is generating a loaderror if I try to run message.rb file

class Message

  def send(total) 
    arrival_time = (Time.now + 60*60).strftime("%H:%M")
    #order_cost = total
    total = '%.2f' % total
    Twilio::REST::Client.new(ENV['TWILIO_ID'], ENV['TWILIO_TOKEN']).messages.create(
      from: ENV['TWILIO_NUM'],
      to: ENV['MY_NUM'],
      body: "Thank you for your order, which totals to £#{total}. Your food will arrive by #{arrival_time}"
      )
    "Thank you for your order, which totals to £#{total}. Your food will arrive by #{arrival_time}"
  end 
end