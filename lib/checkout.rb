require 'rubygems'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Text
  def message
  account_sid = ENV["ACCOUNT_SID"]
  auth_token = ENV['AUTH_TOKEN']

  @client = Twilio::REST::Client.new(account_sid, auth_token)
  @client.messages.create(
    to: ENV['MY_NUMBER'],
    from: '+12057297392',
    body: "Thank you for your order, it should be with you at #{Time.now + 3600}"
  )
  end
end