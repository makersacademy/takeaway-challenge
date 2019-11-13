# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
=begin
require 'twilio-ruby'

account_sid = 'ACb61c8249a0ef3c9a3bf2a0da253ed513'
auth_token = '14059944f95ab9a882ba2962b290d0ab'
client = Twilio::REST::Client.new(account_sid, auth_token)

from = '+44xxxxxxxx' # Your Twilio number
to = '+44xxxxxxxx' # Your mobile phone number

client.messages.create(
from: from,
to: to,
body: "Hey friend!"
)
=end
require 'twilio-ruby'
require 'rubygems'

account_sid = "ACb61c8249a0ef3c9a3bf2a0da253ed513" # Your Test Account SID
auth_token = "14059944f95ab9a882ba2962b290d0ab" # Your Test Auth Token 

@client = Twilio::REST::Client.new(account_sid, auth_token)
message = @client.messages.create(
    body: "Hello from Ruby",
    to: "+447950350613", # Replace with your phone number
    from: "+15005550006") # Use this Magic Number for creating SMS

puts message.sid
