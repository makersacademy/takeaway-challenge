
require 'twilio-ruby'
Dotenv.load
# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new (
ACCOUNT_SID = ENV['TWILIO_ACCOUNT_SID'],
AUTH_TOKEN = ENV['TWILIO_AUTH_TOKEN']
PHONE_NUMBER = ENV['MOBILE_NUMBER']

@client.account.messages.create({
  :from => ENV['TWILIO_PHONE_NUMBER'],
  :to => ENV['MOBILE_NUMBER'],
  :body => 'Your order is planned for delivery at 22.31',
})
#task is to set up message content with stubs etc.
#run twilio_test.rb ruby from command line
