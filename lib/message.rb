require 'twilio-ruby'
require 'dotenv'
Dotenv.load

 
account_sid = ENV["ACCOUNT_SID"]
auth_token = ENV["AUTH_TOKEN"]
@client = Twilio::REST::Client.new account_sid, auth_token
 
from = '+441600800013'
super_secret = ENV['SUPER_SECRET']

@client.account.messages.create({
	:from => from,
	:to => super_secret,  
	:body => 'Thank you! Your order was placed and will be delivered soon'  
})