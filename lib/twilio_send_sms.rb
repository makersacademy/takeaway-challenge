require 'time'
require 'rubygems'
require 'twilio-ruby'

account_sid = 'AC333178587a7438a32fd05c671b5f04c1'
auth_token = '{{ 065d26880d82936f95552e584854f307 }}'
@client = Twilio::REST::Client.new account_sid, auth_token
 
message = @client.account.messages.create(
	:body => "Thank you for placing an order with Yuck Yuck Yuck! Your order will arrive in #{(Time.now + 60*60)asctime}",
    :to => "+447986454727",     # Replace with your phone number
    :from => "+441290211184")   # Replace with your Twilio number
puts message.sid