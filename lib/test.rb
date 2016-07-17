require 'rubygems'
require 'twilio-ruby'
require './twilio-keys.rb'

client = Twilio::REST::Client.new ACCOUNT_SID, AUTH_TOKEN
time = Time.new
hour = time.hour
minute = time.min

client.account.messages.create(
  :from => MY_TWILIO_NUMBER,
  :to => NUMBER_TO_SEND,
  :body => "Thank you! Your order was placed and will be delivered before #{hour}:#{minute}"
)
puts "Sent message!"
