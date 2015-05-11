require 'twilio-ruby'

# put your own credentials here
account_sid = ENV['ACCOUNT_SID']
auth_token =  ENV['AUTH_TOKEN']

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

@message = @client.account.messages.create({:to => "+447477974890",:from => "+447477974890",:body => "Hello!"})