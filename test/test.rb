require 'rubygems'
require 'twilio-ruby'
require 'sinatra'
require 'envyable'
Envyable.load('../config/env.yml', 'development')

account_sid = ENV['TWILIO_ACCOUNT_SID']
auth_token = ENV['TWILIO_AUTH_TOKEN']

@client = Twilio::REST::Client.new(account_sid, auth_token)

@client.account.messages.create({
  :to => '+447849539544',
  :from => '+441315101231',
  :body => 'Hi big guy',
})
