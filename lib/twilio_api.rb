require 'twilio-ruby'
require 'dotenv'
Dotenv.load

module Messenger

  def sendMessage(message_out,_receiver)
    
  account_sid = ENV["ACCOUNT_SID"]
  auth_token = ENV["AUTH_TOKEN"]
   
  @client = Twilio::REST::Client.new account_sid, auth_token 
   
  @client.account.sms.messages.create(
    from: ENV["FROM"],
    to: ENV["TO"],
    body: message_out,
    )
  end
end