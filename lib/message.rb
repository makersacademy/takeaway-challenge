require 'rubygems'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load


account_sid = ENV['SID']
auth_token = ENV['TOKEN']

@client = Twilio::REST::Client.new account_sid, auth_token

@client.messages.create(
  from: ENV['FROM'],
  to: ENV['MY_NUMBER'],
  body: "Thank you! Your order was placed and will be delivered before #{Time.now.hour + 1}:#{Time.now.min}"
)
