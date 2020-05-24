require 'rubygems'
require 'twilio-ruby'

def text_message(body)
  account_sid = ENV["ACCOUNT_SID"]
  auth_token = ENV["AUTH_TOKEN"]
  @client = Twilio::REST::Client.new(account_sid, auth_token)

  message = @client.messages
    .create(
      body: body,
      from: ENV["TWILIO_NUM"],
      to: ENV["PHONE_NUM"]
    )

  puts message.sid

end
