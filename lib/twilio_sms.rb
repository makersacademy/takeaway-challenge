# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'checkout'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load

# Class Twilio_SMS

def initialize
# Find your Account SID and Auth Token at twilio.com/console
# and set the environment variables. See http://twil.io/secure
  client = Twilio::REST::Client.new(
    ENV['TWILIO_ACCOUNT_SID'],
    ENV['TWILIO_AUTH_TOKEN']
  )
end

def send_sms
  client.messages.create(
    from: "[MY TWILIO NUMBER]",
    to: "[MY PHONE NUMBER]",
    body: @sms
  )
end