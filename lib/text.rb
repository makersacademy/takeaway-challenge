# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require './twilio-ruby'

class Message 
    account_sid = ENV['AC988c394b4ef230aaf49d2bda2cb5333e']
    auth_token = ENV['d82ba913d191bbd12e434104c2b72a03']

    def initialize
      @client = Twilio::REST::Client.new(account_sid, auth_token)
    end
    
    def send
        message = @client.messages
        .create(
           body: 'Thank you! Your order was placed and will be delivered before #{delivery_time}',
           from: '+18634745616',
           to: ''
         )
      
      puts message.sid
    end


  def delivery_time
    time = (Time.now + 1 * 60 * 60).strftime("%R")
  end
   
end



