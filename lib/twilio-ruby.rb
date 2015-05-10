require 'rubygems'
require 'twilio-ruby'
require 'Time'

account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
@client = Twilio::REST::Client.new account_sid, auth_token
time = Time.now
@client.account.messages.create(
body: "Thank you!  Your order was placed and will be delivered before #{(time.hour) + 1}:#{time.min}",
to: ENV['TWILIO_TO_TEL'],
from: ENV['TWILIO_FROM_TEL'])
