require 'rubygems'
require 'twilio-ruby'

account_sid = 'XXXff3cd2a843492f5b98c2eda1836ebe7'
auth_token = 'XXXa332b30984a182c2d3278bd93f81b'
@client = Twilio::REST::Client.new(account_sid, auth_token)

time = Time.now
time += 3600

message = @client.messages.create(
from: '+44XXX2252604',
to: '+44XXX6425062',
body: "Thank you! Your order was placed and will be delivered before #{time}"
)

puts message.sid
