require("bundler")
require 'rubygems'
require 'twilio-ruby'
Bundler.require()

account_sid = 'AC86034aa197ed9a4cdca39b9baa42a6c2'
auth_token = 'c9737d3b3f8911541d67c5f3ef45d87c'

@client = Twilio::REST::Client.new account_sid, auth_token

@client.api.account.messages.create(
  from: '+441344567404',
  to: '+447434839577',
  body: 'ZAMOWIENIE!'
)
