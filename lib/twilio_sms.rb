# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'

# Find your Account SID and Auth Token at twilio.com/console
# and set the environment variables. See http://twil.io/secure
account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']
@client = Twilio::REST::Client.new(account_sid, auth_token)

message = @client.messages.create(
                             body: "Thank you ! your order was place and will be delivered in 1 hour ",
                             from: "+44 7888 865757",
                             to: ENV['MY_PHONE_NUMBER']
                           )

puts message.sid



# Download the helper library from https://www.twilio.com/docs/ruby/install
# require 'checkout'
# require 'twilio-ruby'
# require 'dotenv'
# # Dotenv.load
# require("bundler")
# Bundler.require()

# def initialize
# Find your Account SID and Auth Token at twilio.com/console
# and set the environment variables. See http://twil.io/secure
#   @client = Twilio::REST::Client.new(
#     ENV['TWILIO_ACCOUNT_SID'],
#     ENV['TWILIO_AUTH_TOKEN']
#   )
# end

# # def send_sms
#   @client.messages.create(
#     from: ENV['MY_PHONE_NUMBER'],
#     to: "+44 7888 865757",
#     body: "Thank you ! your order was place and will be delivered in 1 hour "
#   )
# # end