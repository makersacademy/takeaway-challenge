#DISCLAIMER - I needed to lift much of this wording from other projects as I needed help activating Twilio within the takeaway project

module Text

def send_text
  time = Time.new
  time1hr = time + 3600
  puts "Thank you! Your order was placed and will be delivered before #{time1hr.strftime("%I:%M%p")}."
  account_id
  message
end

def account_id
  account_sid = "ACef150939084274114fcf2e876d04335b" # Your Account SID from www.twilio.com/console
  auth_token = "*******************"   # Your Auth Token from www.twilio.com/console
  @client = Twilio::REST::Client.new account_sid, auth_token
end

def message
  message = @client.account.messages.create(:body => "Thank you! Your order was placed and will be delivered before 18:52",
      :to => "******",   # Replace with your phone number
      :from => "*********")  # Replace with your Twilio number

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
