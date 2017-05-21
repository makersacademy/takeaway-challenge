require 'dotenv/load'
require 'twilio-ruby'


account_sid = ENV['TWILIO_ACCOUNT_SID'] # Your Account SID from www.twilio.com/console
auth_token = ENV['TWILIO_AUTH_TOKEN']    # Your Auth Token from www.twilio.com/console

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.account.messages.create(:body => "Hello from Ruby",
    :to => ENV['MY_PHONE_NUMBER'],    # Replace with your phone number
    :from => ENV['TWILIO_PHONE_NUMBER'])  # Replace with your Twilio number

puts message.sid
