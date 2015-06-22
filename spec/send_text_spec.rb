require 'rubygems' # not necessary with ruby 1.9 but included for completeness 
require 'twilio-ruby'
require 'Send_Text'

describe Send_Text do 

  it ' send a text' do 

account_sid = ENV['account_sid'] 
auth_token = ENV['auth_token']

# set up a client to talk to the Twilio REST API 
@client = Twilio::REST::Client.new account_sid, auth_token 

pizza = double :pizza, number: '+441293311548'
customer = double :customer, number: ENV('my_number')

messages = double :dummy_messages 
client = double :client, messages: messages
expect(dummy_message).to receive :create 

Send_Text.new( message: 'Hello', from: pizza, to: customer)
end 
end 

