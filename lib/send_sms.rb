require 'twilio-ruby'
require_relative 'undisclosed'

#these are the account credentials
account_sid = Undisclosed::ACCOUNT_SID
auth_token = Undisclosed::AUTH_TOKEN

#set up a client to talk to the Twilio Rest API
@client = Twilio::REST::Client.new account_sid, auth_token

@client.account.messages.create(
    :from => Undisclosed::TWILIO_NO,
    :to => Undisclosed::MY_NO,
    :body => "Hey there!"
  )

puts "Message has been sent"
