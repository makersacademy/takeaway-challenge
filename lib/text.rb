#DISCLAIMER - I needed to lift much of this wording from other projects as I needed help activating Twilio within the takeaway project
require 'envyable'
Envyable.load('./config/env.yml', 'development')


module Text

def send_text
  time = Time.new
  time1hr = time + 3600
  puts "Your order will be delivered before #{time1hr.strftime("%I:%M%p")}."
  account_id
  message
end

def account_id
  account_sid = ENV['TWILIO_ACCOUNT_SID']# Your Account SID from www.twilio.com/console
  auth_token = ENV['TWILIO_AUTH_TOKEN']   # Your Auth Token from www.twilio.com/console
  @client = Twilio::REST::Client.new account_sid, auth_token
end

def message
  message = @client.account.messages.create(
      :body => "Thank you! Your order was placed and will be delivered before 18:52",
      :to => "+*******",   # Replace with your phone number
      :from => "+44******")  # Replace with your Twilio number

puts message.sid
end

end



# require 'rubygems'
# require 'twilio-ruby'
# require 'sinatra'

# get '/' do
#     'Hello World! Currently running version ' + Twilio::VERSION + \
#         ' of the twilio-ruby library.'
# end
