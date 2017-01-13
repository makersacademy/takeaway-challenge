# require 'rubygems'
# require 'twilio-ruby'
# require 'sinatra'
#
# get '/' do
#     'Hello World! Currently running version ' + Twilio::VERSION + \
#         ' of the twilio-ruby library.'
# end

require 'twilio-ruby'

# put your own credentials here
account_sid = 'ACd269071956b7538a177d6059116803da'
auth_token = 'aeb50fc58ca87617b2ccbbe9eaedd2b7'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new (
ENV['TWILIO_ACCOUNT_SID'],
ENV['TWILIO_AUTH_TOKEN']

@client.account.messages.create({
  :from => ENV['TWILIO_PHONE_NUMBER'],
  :to => ENV['MOBILE_NUMBER'],
  :body => 'Your order is planned for delivery at 22.31',
})
#task is to set up message content with stubs etc.
#run twilio_test.rb ruby from command line
