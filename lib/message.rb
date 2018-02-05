require("bundler")
require 'rubygems'
require 'twilio-ruby'
require 'dotenv/load'

Bundler.require()

class Message

  time = Time.new + 60 * 60
  account_sid = ENV['ACCOUNT_SID']
  auth_token = ENV['AUTH_TOKEN']
  @client = Twilio::REST::Client.new account_sid, auth_token
  @client.api.account.messages.create(
    from: '+441344567404',
    to: ENV['TO_TWILLIO'],
    body: "Thank you! Your order was placed and will be delivered before #{time.hour}:#{time.min}"
  )

end
