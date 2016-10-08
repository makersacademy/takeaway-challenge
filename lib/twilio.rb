require 'rubygems'
require 'twilio-ruby'
require 'sinatra'


account_sid = "ACef150939084274114fcf2e876d04335b" # Your Account SID from www.twilio.com/console
auth_token = "199f5831815cf7e8e8d1347d7e8be5a0"   # Your Auth Token from www.twilio.com/console

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.account.messages.create(:body => "Hello from Ruby",
    :to => "07866489230",   # Replace with your phone number
    :from => "07866489230")  # Replace with your Twilio number

puts message.sid


# require 'rubygems'
# require 'twilio-ruby'
# require 'sinatra'

# get '/' do
#     'Hello World! Currently running version ' + Twilio::VERSION + \
#         ' of the twilio-ruby library.'
# end
