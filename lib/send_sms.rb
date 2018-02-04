# require 'rubygems'
# require 'twilio-ruby'
require ('bundler')
Bundler.require()

account_sid = ENV["TWILIO_ACCOUNT_SID"]
auth_token = ENV["TWILIO_AUTH_TOKEN"]

@client = ::Twilio::REST::Client.new(account_sid, auth_token)

@client.messages.create(
  to: ENV["MY_PHONE_NUMBER"],
  from: '+441412804093',
  body: 'Tomorrow\'s forecast in Financial District, San Francisco is Clear.',
)
