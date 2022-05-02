require_relative 'text'
require 'twilio-ruby'
require 'dotenv'

account_sid = ENV['ACCOUNT_SID']
auth_token = ENV['AUTH_TOKEN']
client = Twilio::REST::Client.new(account_sid, auth_token)

text = Text.new(client)
text.send_message
